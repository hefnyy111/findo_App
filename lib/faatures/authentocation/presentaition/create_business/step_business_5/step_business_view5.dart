// faatures/authentocation/presentaition/create_business/step_business_5/step_business_view5.dart
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_1/views/widgets/step_progress.dart';
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_2/action/step_business_action2.dart';
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_5/action/step_business_action5.dart';
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_5/manager/step_business_cubit5.dart';
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_5/manager/step_business_states5.dart';
import 'package:findo/shared/Components/components.dart';
import 'package:findo/shared/Components/custom_buttonNavigation.dart';
import 'package:findo/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class StepBusinessView5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StepBusinessCubit5(),
      child: BlocConsumer<StepBusinessCubit5, StepBusinessStates5>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit_stepBusiness5 = StepBusinessCubit5.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: cubit_stepBusiness5.forkey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // ******************************* Sizebox
                      SizedBox(height: 100.0),
                      // ******************************* Text
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
                      StepProgress(currentStep: 5, totalSteps: 5),
                      // ******************************* Sizebox
                      SizedBox(height: 20),
                      // ******************************* About Your Business
                      Text(
                        'About Your Business',
                        style: TextStyle(
                            fontFamily: 'SF-Pro-Rounded-Bold',
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                        ),
                      ),
                      // ******************************* Sizebox
                      SizedBox(height: 20),
                      // ******************************* Short Description
                      Text(
                        'Short Description',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.ksubTitle,
                        ),
                      ),
                      // ******************************* Sizebox
                      SizedBox(height: 15),
                      // ******************************* Description Field
                      customTextFormField(
                        minLines: 1,
                        maxLines: null,
                        controller: cubit_stepBusiness5.description,
                        validate: (value) {},
                        onChanged: (value) {
                          cubit_stepBusiness5.changeButton(
                            value,
                            context,
                            custom_functionButton:  () =>
                                      StepBusinessAction5.StepBusiness5ButtonPress(
                                      value,
                                      context,
                                      "finish",
                                    ),
                          );
                        },
                        text: 'Write Description',
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
                          enabled: cubit_stepBusiness5.startShimmer,
                          direction: ShimmerDirection.fromLBRT(),
                          child: customButton(
                            function: cubit_stepBusiness5.functionButton,
                            text: "Finish",
                            colorBorderside: cubit_stepBusiness5.buttonEnable,
                            backColor: cubit_stepBusiness5.buttonEnable,
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
