// features/auth/presentation/Sign_up/step_account_3/action/step_account3_action.dart
import 'dart:io';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/manager/step_account3_cubit.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_4/step_account4_view.dart';
import 'package:Ascend/shared/Components/components.dart';
import 'package:Ascend/shared/core/constants/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class StepAccount3Action {
  static void StepAccount_3Action(full_name, username, password, context, String? action) {
     var cubit_step3 = StepAccount3Cubit.get(context);

    switch(action) {
      // ******************************* Button 3
      case "next_step4": {
       if(cubit_step3.profileImage == null) {
        print('no photo');

       } else {
        print('Path ${cubit_step3.profileImage!.path}');
        navgiatorPush(context, StepAccount4View(full_name: full_name, username: username, password: password, photo_url: cubit_step3.profileImage!.path.trim(),));
       }
      }
      break;
      
      // ******************************* Back => 2
      case 'back_step2': {
         Navigator.pop(context);
      }
    }
  }
}