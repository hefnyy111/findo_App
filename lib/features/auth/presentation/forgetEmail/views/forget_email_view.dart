// features/auth/presentation/forgetEmail/views/forget_email_view.dart
import 'package:Ascend/shared/Components/components.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ForgetEmailView extends StatelessWidget {
  const ForgetEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kbackgroundColor,
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        titleSpacing: 0.0,
        backgroundColor: AppColors.kbackgroundColor,
        leading: customIconback(funtions: () {
          Navigator.pop(context);
        }),
        title: Text(
          'Find your account',
          style: TextStyle(color: Colors.white, fontSize: 19),
        ),
      ),

      body: Container(
        child: Padding(
          padding: EdgeInsetsGeometry.all(24.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ******************************* Sizebox
                const SizedBox(height: 120.0),
                // ******************************* image of email
                Image.asset(
                  'assets/Images/Auth/forger_email/email_image.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                // ******************************* Sizebox
                const SizedBox(height: 30.0),
                // ******************************* Text 1
                Text(
                  "Enter your phone number or username, and\nwe’ll help you find your account.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.kGreyColor,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
                // ******************************* Sizebox
                const SizedBox(height: 50.0),
                customTextFormField(
                  controller: TextEditingController(),
                  validate: (value) {},
                  onChanged: (valuee) {},
                  text: "Phone number or username",
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(25),
          child: Shimmer(
            duration: Duration(seconds: 4),
            interval: Duration(seconds: 1),
            color: Colors.grey,
            colorOpacity: 1,
            enabled: true,
            direction: ShimmerDirection.fromLBRT(),
            child: customButton(
              function: () {},
              text: "Continue",
              colorBorderside: AppColors.kPrimaryColor,
              backColor: AppColors.kPrimaryColor,
              colorText: Colors.white,
              width: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
