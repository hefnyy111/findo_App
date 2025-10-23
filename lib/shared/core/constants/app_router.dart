// shared/core/constants/app_router.dart
// shared/core/constan
import 'package:findo/faatures/auth/presentaition/get_Started/get_started_view.dart';
import 'package:findo/faatures/auth/presentaition/splash_screen/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const kSplashScreenView = '/';
  static const kGetStartedView = '/GetStartedView';
  static const kSelectAccountView = '/selectAccountView';
  static const kStepCreateBusiness1 = '/StepBusinessView1';
  static const kStepCreateBusiness2 = '/StepBusinessView2';
  static const kStepCreateBusiness3 = '/StepBusinessView3';
  static const kStepCreateBusiness4 = '/StepBusinessView4';
  static const kStepCreateBusiness5 = '/StepBusinessView5';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashScreenView,
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: kGetStartedView,
        builder: (context, state) => GetStartedView(),
      ),
      // GoRoute(path: kSelectAccountView, builder: (context, state) => SelectAccountView(),),
      // GoRoute(path: "/", builder: (context, state) => StepBusinessView1(),),
      // GoRoute(path: "/", builder: (context, state) => StepBusinessView3()),
      // GoRoute(path: "/", builder: (context, state) => StepBusinessView4()),
      //  GoRoute(path: "/", builder: (context, state) => StepBusinessView5()),
    ],
  );
}
