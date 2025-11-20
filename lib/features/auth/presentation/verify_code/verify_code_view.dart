// features/auth/presentation/verify_code/verify_code_view.dart
import 'package:Ascend/features/auth/presentation/verify_code/manager/verify_code_cubit.dart';
import 'package:Ascend/features/auth/presentation/verify_code/manager/verify_code_states.dart';
import 'package:Ascend/features/auth/presentation/verify_code/widgets/field_otp_view.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
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
             var cubitVerify = VerifyCodeCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.black,
            body: Padding(
              padding: EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                  // ******************************* Code incorrect
                  if(cubitVerify.showCodeIncorrect) ...[
                  const SizedBox(height: 20,),
                  Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.kbackGroundField,
                          border: Border.all(color: Colors.white12, width: 2),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: AnimatedTextKit(
                          isRepeatingAnimation: false, // يظهر مرة واحدة بس
                          animatedTexts: [
                            FadeAnimatedText(
                              'Incorrect code',
                              duration: Duration(milliseconds: 2000),
                              textStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ] else ...[
                  ],
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
            ),
          );
        },
        ),
    );
  }
}