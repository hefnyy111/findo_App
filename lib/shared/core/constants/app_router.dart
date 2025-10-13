import 'package:findo/faatures/authentocation/presentaition/get_Started/get_started_view.dart';
import 'package:findo/faatures/authentocation/presentaition/splash_screen/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
   static const kGetStartedView= '/getStartedView';
  static final router = GoRouter(
    routes: [GoRoute(path: '/', builder: (context, state) => SplashView()),
    GoRoute(path: kGetStartedView, builder: (context, state) => GetStartedView())],
  );
  
}
