// features/auth/presentation/Sign_up/steip_account_1/step_account1_view.dart
import 'package:Ascend/features/auth/presentation/Sign_up/steip_account_1/manager/step_account1_cubit.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/steip_account_1/manager/step_account1_states.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/widgets/step_progress.dart';
import 'package:Ascend/shared/Components/components.dart';
import 'package:Ascend/shared/core/constants/app_router.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class StepAccount1View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StepAccount1Cubit(),
      child: BlocConsumer<StepAccount1Cubit, StepAccount1States>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit_step1 = StepAccount1Cubit.get(context);
          return Scaffold(
            backgroundColor: AppColors.kbackgroundColor,
            appBar: AppBar(
            backgroundColor: AppColors.kbackgroundColor,
              leading: customIconback(funtions: () {
                GoRouter.of(context).go(AppRouter.kGetStartedView);
              }),
            ),
            body: Padding(
              padding: EdgeInsets.all(20.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ******************************* Step Progress
                  StepProgress(currentStep: 1, totalSteps: 5),
                  // ******************************* Sizebox
                  SizedBox(height: 60.0),
                  // ******************************* Account details
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Account Details',
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
                      'Let\'s start by setting up your name and\nusername',
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
                    controller: cubit_step1.full_name,
                    validate: (value) {},
                    onChanged: (value) {},
                    text: "Name",
                  ),
                ],
              ),
            ),
                  // ******************************* Button Next
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
                        text: "Next",
                        colorBorderside: AppColors.kPrimaryColor,
                        backColor: AppColors.kPrimaryColor,
                        colorText: Colors.white,
                        width: double.infinity,
                      ),
              ),
            ),
            ),

          );
        },
      ),
    );
  }
}
