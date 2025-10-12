import 'package:findo/shared/Components/custom_button_border.dart';
import 'package:findo/shared/Components/custom_button.dart';
import 'package:flutter/material.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/Images/logo/logo_findo.png'),
          Text(
            'Welcome to Findo',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
            ),
          ),
          CustomButtonBorder(title: 'Get Started'),
          CustomButton(text: 'Sign in'),
        ],
      ),
    );
  }
}
