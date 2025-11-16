// features/auth/presentation/sign_in/views/code_view.dart
import 'package:Ascend/features/auth/presentation/sign_in/manager/cubit/verify_code_cubit.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CodeView extends StatelessWidget {
  const CodeView({super.key});

  @override
  Widget build(BuildContext context) {
    var verifyCodeCubit = VerifyCodeCubit.get(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 200.0),
          // ******************************* Text 1
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    'Enter your Code',
                    style: TextStyle(
                      fontFamily: 'SF-Pro-Rounded-Bold',
                      color: Colors.white,
                      fontSize: 26,
                      height: 1.4,
                    ),
                  ),
                  // ******************************* Sizebox
                  const SizedBox(height: 20.0),
                  // ******************************* Text 2
                  Text(
                    "We sent a 6-digit code to your email. \n Entre it below to access your purchase",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.kGreyColor,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // OtpCode(),
                  
                  const SizedBox(height: 20.0),
                  // CustomRow(text1: 'Dont receive a code ?', text2: 'Resend'),
                  const SizedBox(height: 200.0),
                ],
              ),
            ),
          ),
          // ******************************* Sizebox
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}
