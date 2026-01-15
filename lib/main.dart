// main.dart

import 'package:Ascend/features/auth/presentation/get_Started/language/manager/language_cubit.dart';
import 'package:Ascend/features/auth/presentation/get_Started/language/manager/language_states.dart';
import 'package:Ascend/features/auth/presentation/sign_in/manager/sign_in_cubit.dart';
import 'package:Ascend/features/auth/services/notification_service.dart';
import 'package:Ascend/firebase_options.dart';
import 'package:Ascend/generated/l10n.dart';
import 'package:Ascend/shared/core/services/bloc_observer_class.dart';
import 'package:Ascend/shared/core/constants/app_router.dart';
import 'package:Ascend/shared/network/cashe_helper.dart';
import 'package:Ascend/shared/network/dio_helper.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("🔹 Background message received: ${message.data}");
}
 
void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  DioHelper.init();
  await CasheHelper.init();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await NotificationService().init();
  
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(
    BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LanguageCubit()..loadSavedLanguage()),
        BlocProvider(create: (context) => SignInCubit())
      ],
      child: BlocBuilder<LanguageCubit, LanguageStates>(
        builder: (context, state) {
          final cubit = LanguageCubit.get(context);

          return MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            locale: Locale(cubit.selectedLanguage == "Arabic" ? 'ar' : 'en'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.black,
              fontFamily: 'SF-Pro-Text-Bold',
            ),
          );
        },
  ),
);
}
}
