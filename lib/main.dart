import 'package:electric_tile_demo/pages/WelcomePageCopy.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      themeMode: ThemeMode
          .system, //This allows the app theme to switch between dark and light mode depending on the current device's mode
      home: WelcomePageCopy(),
    );
  }
}
