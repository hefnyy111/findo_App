// features/auth/presentation/splash_screen/splash_view.dart



import 'package:Ascend/features/auth/presentation/splash_screen/manager/splash_cubit.dart';
import 'package:Ascend/features/auth/presentation/splash_screen/manager/splash_states.dart';
import 'package:Ascend/shared/core/constants/app_router.dart' show AppRouter;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/core/constants/constants.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..LoadingSplash(),
      child: BlocConsumer<SplashCubit, SplashStates>(
        listener: (context, state) {
          if (state is SplashTimeFinishStates) {
            GoRouter.of(context).go(AppRouter.kGetStartedView);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.kbackgroundColor,
            body: BuildSplash(),
          );
        },
      ),
    );
  }
}

// ====================== UI SCREEN ======================
Widget BuildSplash() => Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    // ====================== Image ======================
    Center(
      child: Image(
        image: AssetImage('assets/images/logo_acsend.png'),
        height: 165.0,
        width: 165.0,
        fit: BoxFit.cover,
      ),
    ),
  ],
);
