// main.dart
import 'package:device_preview/device_preview.dart';
import 'package:findo/faatures/authentocation/presentaition/splash_screen/splash_view.dart';
import 'package:findo/shared/core/constants/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routerConfig: AppRouter.router,
      debugShowMaterialGrid: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: DevicePreview(enabled: true, builder: (context) => SplashView()),
    );

  }
}

