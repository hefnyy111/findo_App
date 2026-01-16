// features/auth/presentation/Sign_up/step_account_1/action/step_account1_action.dart

import 'package:Ascend/features/auth/presentation/Sign_up/step_account_1/manager/step_account1_cubit.dart';
import 'package:Ascend/shared/Components/components.dart';
import 'package:Ascend/shared/core/constants/app_router.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StepAccount1Action {
  static void StepAccount_1Action(context, String? action, {String? value}) {
    var cubit_step1 = StepAccount1Cubit.get(context);

    switch(action) {
       // ******************************* Next => 2
      case 'next_details': {
        cubit_step1.checkUsername(username: cubit_step1.username.text);
      }
      break;
       // ******************************* Back to home
      case 'back_home': {
         showMessage(context,
                
                width1: double.infinity,
                text1: "Are you sure you want to exit?",
                text2: "If you exit now, your progress will be\nlost and the account will not be created.\nAre you sure you want to leave?",
                text_button1: "Exit",
                text_buttonSize1: 15,
                textColor_button1: Colors.white,
                color_buttonBackground1: AppColors.kPrimaryColor,

                text_button2: "Cancel",
                text1_buttonSize2: 13,
                textColor_button2: Colors.white,
                color_buttonBackground2: Colors.transparent,
                
                onpressed_button1: () async {
                await loadingScreen(context, 2);
                  GoRouter.of(context).go(AppRouter.kGetStartedView);
                },
                onpressed_button2: () {
                  Navigator.pop(context);
                },
                );
      }
  };
  }
}
