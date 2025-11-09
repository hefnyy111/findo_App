

import 'package:Ascend/features/auth/presentation/sign_in/manager/cubit/verify_code_cubit.dart';

import 'package:Ascend/features/auth/presentation/Sign_up/steip_account_1/step_account1_view.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_2/step_account2_view.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/step_account3_view.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_4/step_account4_view.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_5/step_account5_view.dart';
import 'package:Ascend/features/auth/presentation/get_Started/get_started_view.dart';
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

      // GoRoute( path: "/", builder: (context, state) => SignInView(),),
      // GoRoute( path: kSignInCountriesView, builder: (context, state) => SignInCountriesView(),),
      GoRoute(path: '/', builder: (context, state) => StepAccount4View(),),

    ],
  );
}
