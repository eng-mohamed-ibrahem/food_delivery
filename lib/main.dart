import 'package:flutter/material.dart';
import 'package:food_delivery/contoller/shared_helper/shared_helper.dart';
import 'package:food_delivery/root/root_app.dart';
import 'contoller/utils/user_location_service.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedHelper.init();
  await UserLocationService.getCurrentPosition();
  runApp(const RootApp());
}
