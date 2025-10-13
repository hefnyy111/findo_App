import 'package:findo/shared/Components/components.dart';
import 'package:findo/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   'assets/Images/logo_findo.png',
            //   height: 100,
            //   width: 100,
            // ),
            SizedBox(height: 20),
            Text(
              'Welcome to Findo',
              style: TextStyle(
                color: AppColors.kPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            customButton(
              function: () {},
              text: 'Get Started',
              colorBorderside: Colors.white,
              colorText: Colors.white,
              width: double.infinity,
              backColor: AppColors.kPrimaryColor,
            ),
            SizedBox(height: 20),
            customButton(
              function: () {},
              text: 'Sign In',
              colorBorderside: AppColors.kPrimaryColor,
              colorText: AppColors.kPrimaryColor,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
