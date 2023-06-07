import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../contoller/utils/light_theme.dart';
import '../view/screen/splash.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: getLightTheme(),
        home: const Splash(),
      ),
    );
  }
}
