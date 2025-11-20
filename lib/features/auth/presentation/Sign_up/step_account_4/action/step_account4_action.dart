// features/auth/presentation/Sign_up/step_account_4/action/step_account4_action.dart
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_4/manager/step_account4_cubit.dart';

class StepAccount4Action { 
  static void StepAccount_4Action(full_name, username, password, photo_url, context, String? value, String? action) {
       var cubit_step4 = StepAccount4Cubit.get(context);
    switch(action) {
      
      case "finish": {
       cubit_step4.createAccount(display_name: full_name, username: username, password: password, photo_url: photo_url, bio: value!);
      }
    }
  }
}