// shared/core/constants/app_router.dart

import 'package:Ascend/features/RegisterVerify/verification_screen.dart';
import 'package:Ascend/features/auth/presentation/get_Started/get_started_view.dart';
import 'package:Ascend/features/auth/presentation/sign_in/phone/widgets/sign_in_countries_view.dart';
import 'package:Ascend/features/auth/presentation/sign_in/sign_in_view.dart';
import 'package:Ascend/features/auth/presentation/splash_screen/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const kSplashScreenView = '/';
  static const kGetStartedView = '/GetStartedView';
  static const kSelectAccountView = '/selectAccountView';
  static const kSignInView = '/SignInView';
  static const kSignInCountriesView = '/SignInCountriesView';
  static final router = GoRouter(
    routes: [
      // GoRoute(
      //   path: kSplashScreenView,
      //   builder: (context, state) => SplashView(),
      // ),
      // GoRoute(
      //   path: kGetStartedView,
      //   builder: (context, state) => GetStartedView(),
      // ),
        // GoRoute( path: "/", builder: (context, state) => SignInView(),),
        // GoRoute( path: kSignInCountriesView, builder: (context, state) => SignInCountriesView(),),

      GoRoute(path: '/', builder: (context, state) => verification_screen(email: 'amarhafny94@gmail.com',),),
    ],
  );
}
