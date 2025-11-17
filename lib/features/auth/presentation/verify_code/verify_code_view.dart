// features/auth/presentation/verify_code/verify_code_view.dart
import 'package:Ascend/features/auth/presentation/verify_code/manager/verify_code_cubit.dart';
import 'package:Ascend/features/auth/presentation/verify_code/manager/verify_code_states.dart';
import 'package:Ascend/features/auth/presentation/verify_code/widgets/field_otp_view.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyCodeCubit()..initFields(),
      child: BlocConsumer<VerifyCodeCubit, VerifyCodeStates>(
        listener: (context, state) {},
        builder:(context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  SizedBox(height: 100.0,),
                // ******************************* Text
                   const Text(
                  "Enter your code",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // ******************************* Sizebox
                const SizedBox(height: 20),

                // ******************************* subtitle
                const Text(
                  "We sent a 6-digit code to your email.\nEnter it below to access your purchase.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.kGreyColor,
                    fontSize: 14,
                  ),
                ),
                // ******************************* Sizebox
                const SizedBox(height: 60,),
                // ******************************* OTP 
                customField(),
                // ******************************* Sizebox
                SizedBox(height: 40,),
                // ******************************* Resend
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Didn\'t receive a code ?', 
                    style: TextStyle(
                      color: AppColors.kGreyColor,
                      fontSize: 13,
                    ),
                    ),

                    SizedBox(width: 5.0,),

                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text('Resend',
                      style: TextStyle(
                      color: AppColors.kPrimaryColor,
                      fontSize: 13,
                      ),
                      ),
                      ),
                  ],
                )
                ],
              ),
            ),
          );
        },
        ),
    );
  }
}