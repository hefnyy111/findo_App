// main.dart
import 'package:Ascend/features/auth/presentation/get_Started/language/cubit/language_cubit.dart';
import 'package:Ascend/features/auth/presentation/get_Started/language/states/language_states.dart';
import 'package:Ascend/generated/l10n.dart';
import 'package:Ascend/shared/core/constants/app_router.dart';
import 'package:Ascend/shared/core/services/bloc_observer_class.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(
    BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => LanguageCubit())],
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
