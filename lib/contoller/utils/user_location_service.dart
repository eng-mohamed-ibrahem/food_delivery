import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

///
/// return position of the user device
/// if location service not enable or permission denies will return Future Error
///
class UserLocationService {
  static late Position currentPosition;
  static late bool serviceEnabled;
  static late LocationPermission locationPermission;
  static late LocationSettings locationSettings;

  /// get location at once by Future
  static Future<Position> getCurrentPosition() async {
    // get location service
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      log('$serviceEnabled');
      // return Future.error('Location Service Disabled');
      locationPermission = await Geolocator.requestPermission();
    }

    // get location permission
    locationPermission = await Geolocator.checkPermission();
    log('$locationPermission');
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.deniedForever) {
        return Future.error('Location Permission is denied');
      }
    }
    // location permission can not request permission again
    if (locationPermission == LocationPermission.deniedForever) {
      locationPermission = await Geolocator.checkPermission();

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // then, here will permission be granted
    return currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  /// To listen for location changes you can call the getPositionStream to receive stream
  /// you can listen to and receive position updates.
  static Stream<Position> getCurrentPositionAsStream() {
    // In certain situation it is necessary to specify some platform specific settings
    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 100,
          forceLocationManager: true,
          intervalDuration: const Duration(seconds: 10),
          // (Optional) Set foreground notification config to keep the app alive
          // when going to the background
          foregroundNotificationConfig: const ForegroundNotificationConfig(
            notificationText:
                "Example app will continue to receive your location even when you aren't using it",
            notificationTitle: "Running in Background",
            enableWakeLock: true,
          ));
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.fitness,
        distanceFilter: 100,
        pauseLocationUpdatesAutomatically: true,
        // Only set to true if our app will be started up in the background.
        showBackgroundLocationIndicator: false,
      );
    } else {
      locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );
    }

    return Geolocator.getPositionStream(locationSettings: locationSettings);
  }
}
