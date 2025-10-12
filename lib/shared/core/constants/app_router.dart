// shared/core/constants/app_router.dart
import 'package:findo/faatures/authentocation/presentaition/get_Started/get_started_view.dart';
import 'package:findo/faatures/authentocation/presentaition/splash_screen/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
   static const klogoView = '/logoView';
  static final router = GoRouter(
    routes: [GoRoute(path: '/', builder: (context, state) => GetStartedView())],
  );
}
