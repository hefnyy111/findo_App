// shared/core/constants/app_router.dart

// shared/core/constants/app_router.dart
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/step_account3_view.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_4/step_account4_view.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_2/step_account2_view.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/step_account3_view.dart';
import 'package:Ascend/features/auth/presentation/forgetEmail/views/forget_email_view.dart';
import 'package:Ascend/features/auth/presentation/sign_in/sign_in_view.dart';
import 'package:Ascend/features/auth/presentation/sign_in/views/code_view.dart';
import 'package:Ascend/features/auth/presentation/verify_code/verify_code_view.dart';
import 'package:Ascend/features/auth/presentation/verify_code/widgets/field_otp_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const kSplashScreenView = '/';
  static const kGetStartedView = '/GetStartedView';
  static const kSelectAccountView = '/selectAccountView';
  static const kSignInView = '/SignInView';
  static const kSignInCountriesView = '/SignInCountriesView';
  static const kStepAccount1View = '/StepAccount1View';
  static const kStepAccount2View = '/StepAccount2View';
  static const kStepAccount3View = '/StepAccount3View';
  static const kStepAccount4View = '/StepAccount4View';
  static const kVerifyCode = '/VerifyCodeView';
  static final router = GoRouter(
    routes: [
      // GoRoute(path: '/', builder: (context, state) => VerifyCodeView()),
       GoRoute(path: '/', builder: (context, state) => SignInView()),
      // GoRoute(path: kVerifyCode, builder: (context, state) => VerifyCodeView(),),
      

    ],
  );
}
