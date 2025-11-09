import 'package:Ascend/shared/Components/components.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';

class ForgetEmailView extends StatelessWidget {
  const ForgetEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/Images/Auth/forger_email/EmailBackground.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.all(24.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ******************************* Sizebox
                const SizedBox(height: 100.0),
                // ******************************* Text 1
                const Center(
                  child: Column(
                    children: [
                      Text(
                        'Forgot your email?',
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
                        "Enter your phone number or username, and we’ll \n help you find your account.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.kGreyColor,
                          fontSize: 15,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                // ******************************* Sizebox
                const SizedBox(height: 50.0),
                // ******************************* image of email
                Image.asset('assets/Images/Auth/forger_email/email.png'),
                // ******************************* Sizebox
                const SizedBox(height: 50.0),
                Expanded(
                  child: customTextFormField(
                    controller: TextEditingController(),
                    validate: (value) {},
                    onChanged: (valuee) {},
                    text: "Phone number or username",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.all(24),
      //   child: ClipRRect(
      //     borderRadius: BorderRadiusGeometry.circular(25),
      //     child: Shimmer(
      //       duration: Duration(seconds: 4),
      //               interval: Duration(seconds: 1),
      //               color: Colors.grey,
      //               colorOpacity: 1,
      //               // enabled: cubit_signin.ButtonShimmer,
      //               direction: ShimmerDirection.fromLBRT(),
      //       child:
      //       customButton(
      //               function: (){},
      //               text: "Continue",
      //               colorBorderside: cubit_signin.borderSide,
      //               backColor: cubit_signin.background_button,
      //               colorText: cubit_signin.text_button,
      //               width: double.infinity,
      //             ),
      //     ),
      //   ),
      //   ),
    );
  }
}
