// features/auth/presentation/Sign_up/step_account_2/action/step_account2_action.dart
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_2/manager/step_account2_cubit.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/step_account3_view.dart';
import 'package:Ascend/shared/Components/components.dart';
import 'package:Ascend/shared/core/constants/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StepAccount2Action {

  static void StepAccount_2Action(context, full_name, username, String? action, {String? value}) {
    var cubit_step2 = StepAccount2Cubit.get(context);
    switch(action) {
           // ******************************* Next password
      case "next_password": {
         if(cubit_step2.password.text.trim() != cubit_step2.confirm_password.text.trim()) {
          customSnackBarMessage(
            context, 
            text: "The two password must be identical.", 
            color: Colors.white
            );
         } else {
          navgiatorPush(context, StepAccount3View(full_name: full_name, username: username, password: value,));
         }
      }
      break;
           // ******************************* Skip password
      case 'skip_password': {
           navgiatorPush(context, StepAccount3View(full_name: full_name, username: username, password: value));
      }
      break;
       // ******************************* Back => 1
       case 'back_step1': {
                  print('BACK PRESSED');
                  Navigator.pop(context);
       }
    }
    
  }
}