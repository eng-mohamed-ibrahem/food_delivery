import 'package:flutter/material.dart';
import 'package:food_delivery/contoller/shared_helper/shared_helper.dart';
import 'package:food_delivery/root/root_app.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedHelper.init();
  runApp(const RootApp());
}
