// features/auth/presentation/Sign_up/step_account_2/action/step_account2_action.dart
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_2/manager/step_account2_cubit.dart';
import 'package:Ascend/shared/Components/components.dart';
import 'package:Ascend/shared/core/constants/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StepAccount2Action {

  static void StepAccount_2Action(context, String? value, String? action) {
    var cubit_step2 = StepAccount2Cubit.get(context);
    switch(action) {
      case "next_password": {
         if(cubit_step2.password.text.trim() != cubit_step2.confirm_password.text.trim()) {
          customSnackBarMessage(
            context, 
            text: "The two password must be identical.", 
            color: Colors.white
            );
         } else {
          GoRouter.of(context).push(AppRouter.kStepAccount3View);
         }
      }
    }
  }
}