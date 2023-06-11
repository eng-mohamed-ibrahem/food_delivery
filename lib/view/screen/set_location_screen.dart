import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/contoller/utils/user_location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../widget/search_bar.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final TextEditingController searchController = TextEditingController();
  late GoogleMapController mapController;
  late BitmapDescriptor markerIcon;
  final Set<Marker> myMarkers = {};

  @override
  void initState() {
    super.initState();
    log('from initState');

    addMarker(
      LatLng(UserLocationService.currentPosition.latitude,
          UserLocationService.currentPosition.longitude),
    );
  }

  void addMarker(LatLng position) {
    myMarkers.clear();
    myMarkers.add(
      Marker(
        markerId: const MarkerId('1'),
        position: position,
        infoWindow: InfoWindow(
          title: 'current position',
          snippet: const LatLng(45.521563, -122.677433).toString(),
        ),
        // icon: markerIcon,
      ),
    );
  }

  void setMarkerIcon() async {
    markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'assets/images/menu_photo.png');
  }

  @override
  Widget build(BuildContext context) {
    log('from build');
    return Scaffold(
        body: Stack(
      children: [
        GoogleMap(
          onMapCreated: (googleMapController) {
            mapController = googleMapController;
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(UserLocationService.currentPosition.latitude,
                UserLocationService.currentPosition.longitude),
            zoom: 12,
          ),
          markers: myMarkers,
          onTap: (argument) async {
            addMarker(argument);
            // move camera to target which is stream of position
            mapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(target: argument, zoom: 15),
              ),
            );
            setState(() {});
          },
        ),
        Positioned(
          top: 20,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomSearchBar(
                hintText: 'Find Your Location',
                textEditingController: searchController,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
