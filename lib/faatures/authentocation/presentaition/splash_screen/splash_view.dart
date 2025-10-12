// faatures/authentocation/presentaition/splash_screen/splash_view.dart
import 'package:findo/faatures/authentocation/presentaition/splash_screen/manager/splash_cubit.dart';
import 'package:findo/faatures/authentocation/presentaition/splash_screen/manager/splash_states.dart';
import 'package:findo/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: BlocConsumer<SplashCubit, SplashStates>(
        listener: (context, state) {
          if (state is SplashTimeFinishStates) {
            print('done');
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
        image: AssetImage('assets/images/logo/logo_findo.png'),
        height: 150.0,
        width: 150.0,
        fit: BoxFit.cover,
      ),
    ),

  ],
);
