// main.dart
import 'package:findo/shared/core/constants/app_router.dart';
import 'package:flutter/material.dart';

import 'faatures/authentocation/presentaition/select_account/select_account_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'SF-Pro-Text-Bold',
      ),
        home: SelectAccountView()
    );
  }
}