import 'package:Ascend/features/auth/presentation/sign_in/phone/widgets/otp_code.dart';
import 'package:Ascend/shared/core/utlis/constants.dart';
import 'package:flutter/material.dart';

class CodeView extends StatelessWidget {
  const CodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100.0),
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
                  OtpCode(),

                  //   Row(
                  //     children: [
                  //       Container(
                  //         padding: const EdgeInsets.symmetric(
                  //           horizontal: 14,
                  //           vertical: 8,
                  //         ),
                  //         decoration: BoxDecoration(
                  //           color: const Color(0xFFF3F3F3),
                  //           borderRadius: BorderRadius.circular(20),
                  //         ),
                  //         child: const Text(
                  //           '331',
                  //           style: TextStyle(
                  //             fontSize: 22,
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.black,
                  //           ),
                  //         ),
                  //       ),
                  //       const SizedBox(width: 10),

                  //       Container(
                  //         padding: const EdgeInsets.symmetric(
                  //           horizontal: 14,
                  //           vertical: 8,
                  //         ),
                  //         decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           border: Border.all(
                  //             color: Color(0xFF5EA8FF),
                  //             width: 2,
                  //           ),
                  //           borderRadius: BorderRadius.circular(20),
                  //         ),
                  //         child: const Text(
                  //           '340',
                  //           style: TextStyle(
                  //             fontSize: 22,
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.black54,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
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