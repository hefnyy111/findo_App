// features/auth/presentation/Sign_up/step_account_1/step_account1_view.dart
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_1/action/step_account1_action.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_1/manager/step_account1_cubit.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_1/manager/step_account1_states.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_2/step_account2_view.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/widgets/step_progress.dart';
import 'package:Ascend/shared/core/utils/lower_case_romatter.dart';
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
        listener: (context, state) {
    if (state is StepAccount1UserAvailableStates) {
       var cubit_step1 = StepAccount1Cubit.get(context);
      navigatorAndFinish(context, StepAccount2View(full_name: cubit_step1.full_name.text, username: cubit_step1.username.text,));

    } else if (state is StepAccount1UserIsTakenStates || state is StepAccount1UserErrorStates) {
      customSnackBarMessage(
        context, 
        text: "This name is already in taken. Please choose another name.", 
        color: Colors.white
        );
    }
        },

        
        builder: (context, state) {
          var cubit_step1 = StepAccount1Cubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset: true,
            extendBodyBehindAppBar: true,
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ******************************* Step Progress
                  StepProgress(currentStep: 1, totalSteps: 4),
                  // ******************************* Sizebox
                  SizedBox(height: 60.0),
                  // ******************************* Account details
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Account Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
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
                    onChanged: (value) {
                       cubit_step1.changeButton(value, onClickButton: () => StepAccount1Action.StepAccount_1Action(context, value, "next_details"),);
                    },
                    text: "Full name",
                  ),
                  // ******************************* Sizebox
                  SizedBox(height: 25.0),
                  // ******************************* Field 1
                  customTextFormField(
                    inputFormatters: [LowerCaseRomatter()],
                    controller: cubit_step1.username,
                    validate: (value) {},
                    onChanged: (value) {
                      cubit_step1.changeButton(value, onClickButton: () => StepAccount1Action.StepAccount_1Action(context, value, "next_details"),);
                    },
                    text: "Username",
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
                        enabled: cubit_step1.shimmer_button,
                        direction: ShimmerDirection.fromLBRT(),
                child: customButton(
                        function: cubit_step1.onpressed_button,
                        text: "Next",
                        colorBorderside: cubit_step1.borderSide_button,
                        backColor: cubit_step1.backGround_button,
                        colorText: cubit_step1.text_button,
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
