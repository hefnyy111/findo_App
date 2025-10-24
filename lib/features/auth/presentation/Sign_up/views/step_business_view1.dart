// feature/auth/presentation/Sign_up/views/step_business_view1.dart
// faatures/authentocation/presentaition/create_business/step_business_1/views/step_busi


import 'package:Ascend/features/auth/presentation/Sign_up/action/step_business_action.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/manager/step_business_cubit1.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/manager/step_business_states1.dart';
import 'package:Ascend/features/auth/presentation/widgets/step_progress.dart';
import 'package:Ascend/shared/Components/custom_buttonNavigation.dart';
import 'package:Ascend/shared/Components/components.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class StepBusinessView1 extends StatelessWidget {
  const StepBusinessView1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StepBusinessCubit1(),
      child: BlocConsumer<StepBusinessCubit1, StepBusinessStates1>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit_stepBusiness1 = StepBusinessCubit1.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: cubit_stepBusiness1.step1_forKey,
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
                    StepProgress(currentStep: 1, totalSteps: 5),
                    // ******************************* Sizebox
                    const SizedBox(height: 20),
                    // ******************************* Findo & Activiy
                    const Text(
                      'Findo & Activity',
                      style: TextStyle(
                        fontFamily: 'SF-Pro-Rounded-Bold',
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    // ******************************* Sizebox
                    const SizedBox(height: 20),
                    // ******************************* Tell us
                    const Text(
                      'Tell us about your Business',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.ksubTitle,
                      ),
                    ),
                    // ******************************* Sizebox
                    const SizedBox(height: 15),
                    // ******************************* Field 1
                    customTextFormField(
                      controller: cubit_stepBusiness1.controller_1,
                      validate: (value) {},
                      onChanged: (value) {
                        cubit_stepBusiness1.changeButton(
                          value,
                          context,
                          custom_functionButton:
                              () => StepBusinessAction.StepBusinessButtonPress(
                                context,
                                "go_step2",
                              ),
                        );
                      },
                      text: 'Business Name',
                    ),
                    // ******************************* Sizebox
                    const SizedBox(height: 20),
                    // ******************************* Business Category
                    const Text(
                      'Business Category',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.ksubTitle,
                      ),
                    ),
                    // ******************************* Sizebox
                    const SizedBox(height: 15),
                    // ******************************* Field2
                    // customTextFormField(
                    //   controller: cubit_stepBusiness1.controller_2,
                    //   validate: (value) {},
                    //   onChanged: (value) {
                    //     cubit_stepBusiness1.changeButton(
                    //       value,
                    //       context,
                    //       custom_functionButton:
                    //           () => StepBusinessAction.StepBusinessButtonPress(
                    //             context,
                    //             "go_step2",
                    //           ),
                    //     );
                    //   },
                    //   text: 'Select a Category',
                    //   suffixIcon: IconButton(
                    //     onPressed: () {},
                    //     icon: Icon(
                    //       Icons.keyboard_arrow_down,
                    //       color: Colors.cyanAccent,
                    //       size: 25,
                    //     ),
                    //   ),
                    // ),
                    // CustomCategoryDropdown(),

                    // CustomCategoryDropdown(),
                    const SizedBox(height: 50),
                    // ******************************* Button
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Shimmer(
                        duration: Duration(seconds: 4),
                        interval: Duration(seconds: 1),
                        color: Colors.white,
                        colorOpacity: 1,
                        enabled: cubit_stepBusiness1.startShimmer,
                        direction: ShimmerDirection.fromLBRT(),
                        child: customButton(
                          function: cubit_stepBusiness1.functionButton,
                          text: "Continue",
                          colorBorderside: cubit_stepBusiness1.buttonEnable,
                          backColor: cubit_stepBusiness1.buttonEnable,
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
