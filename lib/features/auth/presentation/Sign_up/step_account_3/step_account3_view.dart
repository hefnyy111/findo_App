// features/auth/presentation/Sign_up/step_account_3/step_account3_view.dart
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/manager/step_account3_cubit.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/manager/step_account3_states.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/widgets/step_progress.dart';
import 'package:Ascend/shared/Components/components.dart';
import 'package:Ascend/shared/core/constants/app_router.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class StepAccount3View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StepAccount3Cubit(),
      child: BlocConsumer<StepAccount3Cubit, StepAccount3States>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit_step3 = StepAccount3Cubit.get(context);
          return Scaffold(
            backgroundColor: AppColors.kbackgroundColor,
            appBar: AppBar(
              backgroundColor: AppColors.kbackgroundColor,
              leading: customIconback(
                funtions: () {
                  GoRouter.of(context).go(AppRouter.kGetStartedView);
                },
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(20.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ******************************* Step Progress
                  StepProgress(currentStep: 3, totalSteps: 5),
                  // ******************************* Sizebox
                  SizedBox(height: 60.0),
                  // ******************************* Secure your account
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Choose your username',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        height: 1.4,
                      ),
                    ),
                  ),
                  // ******************************* Sizebox
                  SizedBox(height: 10.0),
                  // *******************************
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'This will be your unique identity on Ascend',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: AppColors.kGreyColor,
                        fontSize: 13,
                        height: 1.3,
                      ),
                    ),
                  ),
                  // ******************************* Sizebox
                  SizedBox(height: 30.0),
                  // ******************************* Field 1
                  customTextFormField(
                    controller: cubit_step3.username,
                    validate: (value) {},
                    onChanged: (value) {},
                    text: "Username",
                  ),
                ],
              ),
            ),
            // ******************************* Button Next
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
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
                        text: "Next",
                        colorBorderside: AppColors.kPrimaryColor,
                        backColor: AppColors.kPrimaryColor,
                        colorText: Colors.white,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextButton(
                    onPressed: () {}, 
                    child: Text('Skip',
                    style: TextStyle(
                      color: AppColors.kGreyColor,
                      fontSize: 13
                    ),
                    ),
                    ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
