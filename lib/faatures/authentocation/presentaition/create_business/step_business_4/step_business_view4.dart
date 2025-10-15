// faatures/authentocation/presentaition/create_business/step_business_4/step_business_view4.dart
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_1/views/widgets/step_progress.dart';
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_2/action/step_business_action2.dart';
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_4/action/step_business_action4.dart';
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_4/manager/step_business_cubit4.dart';
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_4/manager/step_business_states4.dart';
import 'package:findo/shared/Components/components.dart';
import 'package:findo/shared/Components/custom_buttonNavigation.dart';
import 'package:findo/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class StepBusinessView4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StepBusinessCubit4(),
      child: BlocConsumer<StepBusinessCubit4, StepBusinessStates4>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit_stepBusiness4 = StepBusinessCubit4.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: cubit_stepBusiness4.forkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ******************************* Sizebox
                    const SizedBox(height: 100.0),
                    // ******************************* Title
                    const Center(
                      child: Column(
                        children: [
                          Text(
                            'Findo',
                            style: TextStyle(
                              fontFamily: 'SF-Pro-Rounded-Bold',
                              color: AppColors.kPrimaryColor,
                              fontSize: 32,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'For Business',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.ksubTitle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ******************************* Sizebox
                    const SizedBox(height: 35),
                    // ******************************* Step Progress
                    StepProgress(currentStep: 4, totalSteps: 5),
                    // ******************************* Sizebox
                    SizedBox(height: 20),
                    // ******************************* Information
                    Text(
                      'Contact Information',
                      style: TextStyle(
                        fontFamily: 'SF-Pro-Rounded-Bold',
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    // ******************************* Sizebox
                    SizedBox(height: 20),
                    // ******************************* full name
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.ksubTitle,
                      ),
                    ),
                    // ******************************* Sizebox
                    SizedBox(height: 15),
                    // ******************************* Field 1
                    customTextFormField(
                      controller: cubit_stepBusiness4.email,
                      validate: (value) {},
                      onChanged: (value) {
                        cubit_stepBusiness4.changeButton(
                          value,
                          context,
                          custom_functionButton: () => StepBusinessAction4.StepBusiness4ButtonPress(value,context,"go_step5",),
                        );
                      },
                      text: 'Entre Your Email',
                    ),
                    // ******************************* Sizebox
                    SizedBox(height: 22),
                    // ******************************* National id
                    Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.ksubTitle,
                      ),
                    ),
                    // ******************************* Sizebox
                    SizedBox(height: 15),
                    // ******************************* Field 2
                    customTextFormField(
                      controller: cubit_stepBusiness4.password,
                      validate: (value) {},
                      onChanged: (value) {
                        cubit_stepBusiness4.changeButton(
                          value,
                          context,
                          custom_functionButton: () => StepBusinessAction4.StepBusiness4ButtonPress(value,context,"go_step5",),
                        );
                      },
                        obscureText: true,
                      text: 'Enter your password',
                    ),
                    // ******************************* Sizebox
                    SizedBox(height: 22),
                    // ******************************* Phone
                    Text(
                      'Repeat Password',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.ksubTitle,
                      ),
                    ),
                    // ******************************* Sizebox
                    SizedBox(height: 15),
                    // ******************************* Field 3
                    customTextFormField(
                      controller: cubit_stepBusiness4.passwordRepeat,
                      keyboard: TextInputType.phone,
                      validate: (value) {},
                      onChanged: (value) {
                        cubit_stepBusiness4.changeButton(
                          value,
                          context,
                          custom_functionButton: () => StepBusinessAction4.StepBusiness4ButtonPress(value,context,"go_step5",),
                        );
                      },
                       obscureText: true,
                      text: ' Entre Password again',
                    ),
                    // ******************************* Sizebox
                    SizedBox(height: 50),
                    // ******************************* Button
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Shimmer(
                        duration: Duration(seconds: 4),
                        interval: Duration(seconds: 1),
                        color: Colors.white,
                        colorOpacity: 1,
                        enabled: cubit_stepBusiness4.startShimmer,
                        direction: ShimmerDirection.fromLBRT(),
                        child: customButton(
                          function: cubit_stepBusiness4.functionButton,
                          text: "Continue",
                          colorBorderside: cubit_stepBusiness4.buttonEnable,
                          backColor: cubit_stepBusiness4.buttonEnable,
                          colorText: Colors.black,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // ******************************* Sizebox Button naviage
            bottomNavigationBar: CustomButtomNavigationBar(
              text1: 'Already have an account?',
              text2: 'Sign In',
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
