// faatures/authentocation/presentaition/get_Started/get_started_view.dart
// faatures/authentocation/presentaition/get_Started/get_started_view.dart
import 'package:findo/shared/Components/components.dart';
import 'package:findo/shared/core/constants/constants.dart';

import 'package:flutter/material.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kbackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ====================== Image ======================
            Image.asset(
              'assets/Images/logo_findo.png',
              height: 135,
              width: 135,
            ),
            // ====================== Sizebox ======================
            const SizedBox(height: 50),
            // ====================== Text 1 ======================
            const Text(
              'Discover Local\nBusiness',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SF-Pro-Rounded-Bold',
                color: Colors.white,
                fontSize: 32,
                
                height: 1.4
              ),
            ),
            // ====================== Sizebox ======================
            const SizedBox(height: 20),
            // ====================== Text 2 ======================
            const Text(
              'Build your brand in minutes, Reach\nyour customers Pay nothing',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.kGreyColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                height: 1.5
              ),
            ),
            // ====================== Sizebox ======================
            const SizedBox(height: 60),
            // ====================== Button 1 ======================
            SizedBox(
              width: double.infinity,
              child: customButton(
                function: () {},
                text: 'Get Started',
                colorBorderside: AppColors.kPrimaryColor,
                colorText: Colors.black,
                width: double.infinity,
                backColor: AppColors.kPrimaryColor,
              ),
            ),
            // ====================== Sizebox ======================
            const SizedBox(height: 25),
            // ====================== Button 2 ======================
            SizedBox(
              width: double.infinity,
              child: customButton(
                function: () {},
                text: 'Sign In',
                colorBorderside: AppColors.kPrimaryColor,
                colorText: Colors.white,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
