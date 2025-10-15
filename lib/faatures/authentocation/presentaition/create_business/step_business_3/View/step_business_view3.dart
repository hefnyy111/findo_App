// faatures/authentocation/presentaition/create_business/step_business_3/View/step_business_view3.dart
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_1/views/widgets/step_progress.dart';
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_2/action/step_business_action2.dart';
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_2/manager/step_business_cubit2.dart';
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_2/manager/step_business_states2.dart';
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_3/action/step_business_action3.dart';
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_3/manager/step_business_cubit3.dart';
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_3/manager/step_business_states3.dart';
import 'package:findo/shared/Components/components.dart';
import 'package:findo/shared/Components/custom_buttonNavigation.dart';
import 'package:findo/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class StepBusinessView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StepBusinessCubit3(),
      child: BlocConsumer<StepBusinessCubit3, StepBusinessStates3>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit_stepBusiness3 = StepBusinessCubit3.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 20,
                ),
                child: Form(
                  key: cubit_stepBusiness3.forkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ******************************* Sizebox
                      const SizedBox(height: 40.0),
                      // ******************************* Title
                      Center(
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
                      StepProgress(currentStep: 3, totalSteps: 5),
                      // ******************************* Sizebox
                      const SizedBox(height: 30),
                      // ******************************* Text
                      Text(
                        'Location Details',
                        style: TextStyle(
                          fontFamily: 'SF-Pro-Rounded-Bold',
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      // ******************************* Sizebox
                      const SizedBox(height: 8),
                      // ******************************* Text
                      Text(
                        'Tell us where business is located',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.ksubTitle,
                        ),
                      ),
                      // ******************************* Sizebox
                      const SizedBox(height: 15),
                      // ******************************* Field 1
                      customTextFormField(
                        controller: cubit_stepBusiness3.area,
                        validate: (value) {},
                        onChanged: (value) {
                          cubit_stepBusiness3.changeButton(
                            value,
                            context,
                            custom_functionButton: () =>
                                    StepBusinessAction3.StepBusiness3ButtonPress(
                                      context,
                                      "go_step4",
                                      value: value,
                                    ),
                          );
                        },
                        text: 'Area / Town',
                      ),
                      // *******************************
                      const SizedBox(height: 20),
                      // ******************************* Text
                      Text(
                        'Detailed Address',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.ksubTitle,
                        ),
                      ),
                      // ******************************* Sizebox
                      const SizedBox(height: 10),
                      // ******************************* Field 2
                      customTextFormField(
                        controller: cubit_stepBusiness3.address,
                        validate: (value) {},
                        onChanged: (value) {
                          cubit_stepBusiness3.changeButton(
                            value,
                            context,
                            custom_functionButton: () =>
                                    StepBusinessAction3.StepBusiness3ButtonPress(
                                      context,
                                      "go_step4",
                                      value: value,
                                    ),
                          );
                        },
                        text: 'Enter your address',
                      ),
                      // ******************************* Sizebox
                      const SizedBox(height: 20),
                      // ******************************* Text
                      Text(
                        'Determine the location',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.ksubTitle,
                        ),
                      ),
                      // ******************************* Sizebox
                      const SizedBox(height: 10),
                      // ******************************* Map
                      GestureDetector(
                        onTap: () => StepBusinessAction3.StepBusiness3ButtonPress(context, 'select_location'),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.kbackGroundField,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ' Pinpoint on Map',
                                  style: TextStyle(
                                    color: AppColors.kGreyColor,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'assets/images/Auth/location/location.png',
                                    width: double.infinity,
                                    height: 180,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // ******************************* Sizebox
                      const SizedBox(height: 50),
                      // ******************************* Button
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Shimmer(
                          duration: const Duration(seconds: 4),
                          interval: const Duration(seconds: 1),
                          color: Colors.white,
                          colorOpacity: 1,
                          enabled: cubit_stepBusiness3.startShimmer,
                          direction: const ShimmerDirection.fromLBRT(),
                          child: customButton(
                            function: cubit_stepBusiness3.functionButton,
                            text: "Continue",
                            colorBorderside: cubit_stepBusiness3.buttonEnable,
                            backColor: cubit_stepBusiness3.buttonEnable,
                            colorText: Colors.black,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ],
                  ),
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
