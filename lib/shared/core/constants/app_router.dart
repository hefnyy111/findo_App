
import 'package:Ascend/features/auth/presentation/sign_in/manager/cubit/verify_code_cubit.dart';

import 'package:Ascend/features/auth/presentation/sign_in/phone/widgets/sign_in_countries_view.dart';
import 'package:Ascend/features/auth/presentation/sign_in/views/code_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      GoRoute(
        path: "/",
        builder:
            (context, state) => BlocProvider(
              create: (context) => VerifyCodeCubit(),
              child: CodeView(),
            ),
      ),
      GoRoute(
        path: kSignInCountriesView,
        builder: (context, state) => SignInCountriesView(),
      ),
    ],
  );
}
