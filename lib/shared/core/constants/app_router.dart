import 'package:findo/faatures/authentocation/presentaition/splash_screen/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
   static const klogoView = '/logoView';
  static final router = GoRouter(
    routes: [GoRoute(path: '/', builder: (context, state) => SplashView())],
  );
}
