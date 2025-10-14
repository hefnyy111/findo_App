// shared/core/constants/app_router.dart
import 'package:device_preview/device_preview.dart';
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_1/action/views/step_business_view1.dart';
import 'package:findo/faatures/authentocation/presentaition/get_Started/get_started_view.dart';
import 'package:findo/faatures/authentocation/presentaition/select_account/action/views/select_account_view.dart';
import 'package:findo/faatures/authentocation/presentaition/splash_screen/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const kGetStartedView = '/getStartedView';
  static const kSelectAccountView = '/selectAccountView';
  static final router = GoRouter(
    routes: [
      // // GoRoute(path: '', builder: (context, state) => SplashView()),
      // GoRoute(path: '/', builder: (context, state) =>  SelectAccountView() ),
      GoRoute(path: '/', builder: (context, state) => StepBusinessView1()),
    ],
  );
}
