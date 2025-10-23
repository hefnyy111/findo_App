// main.dart
import 'package:device_preview/device_preview.dart';
import 'package:findo/faatures/auth/presentaition/get_Started/language/cubit/language_cubit.dart';
import 'package:findo/shared/core/constants/app_router.dart';
import 'package:findo/shared/core/services/bloc_observer_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => LanguageCubit())],
      child: Builder(
        builder:
            (context) => MaterialApp.router(

              // supportedLocales: S.delegate.supportedLocales,
              routerConfig: AppRouter.router,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.black,
                fontFamily: 'SF-Pro-Text-Bold',
              ),
            ),
      ),
    );
  }
}
