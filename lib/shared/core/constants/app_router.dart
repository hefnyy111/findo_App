// shared/core/constants/app_router.dart
import 'package:device_preview/device_preview.dart';
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_1/views/step_business_view1.dart';
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_2/views/step_business_view2.dart';
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_3/View/step_business_view3.dart';
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_4/step_business_view4.dart';
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_5/step_business_view5.dart';
import 'package:findo/faatures/authentocation/presentaition/get_Started/get_started_view.dart';
import 'package:findo/faatures/authentocation/presentaition/select_account/views/select_account_view.dart';
import 'package:findo/faatures/authentocation/presentaition/splash_screen/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const kGetStartedView = '/GetStartedView';
  static const kSelectAccountView = '/selectAccountView';
  static const kStepCreateBusiness1 = '/StepBusinessView1';
  static const kStepCreateBusiness2 = '/StepBusinessView2';
  static const kStepCreateBusiness3 = '/StepBusinessView3';
  static const kStepCreateBusiness4 = '/StepBusinessView4';
  static const kStepCreateBusiness5 = '/StepBusinessView5';
  static final router = GoRouter(
    routes: [
      // GoRoute(path: "/",builder: (context, state) => SplashView(),),
      GoRoute(
        path: kGetStartedView,
        builder: (context, state) => GetStartedView(),
      ),
      GoRoute(
        path: kSelectAccountView,
        builder: (context, state) => SelectAccountView(),
      ),
      GoRoute(path: "/", builder: (context, state) => StepBusinessView1(),),
        // GoRoute(path: "/", builder: (context, state) => StepBusinessView3()),
      // GoRoute(path: "/", builder: (context, state) => StepBusinessView4()),
      //  GoRoute(path: "/", builder: (context, state) => StepBusinessView5()),
    ],
  );
}
