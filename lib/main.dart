import 'package:electric_tile_demo/MQTT/MQTTAppState.dart';
import 'package:electric_tile_demo/pages/WelcomePageCopy.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        themeMode: ThemeMode
            .system, //This allows the app theme to switch between dark and light mode depending on the current device's mode
        home: ChangeNotifierProvider<MQTTAppState>(
          create: (_) => MQTTAppState(),
          child: WelcomePageCopy(),
        ));
  }
}
/*
ChangeNotifierProvider<MQTTAppState>(
          create: (_) => MQTTAppState(),
          child: WelcomePageCopy(),
        )
        */