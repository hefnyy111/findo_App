// features/auth/presentation/Sign_up/steip_account_1/action/step_account1_action.dart
import 'package:Ascend/features/auth/presentation/Sign_up/steip_account_1/manager/step_account1_cubit.dart';
import 'package:Ascend/shared/Components/components.dart';

class StepAccount1Action {
  static void StepAccount_1Action(context, String? value, String? action) {
    var cubit_step1 = StepAccount1Cubit.get(context);

    switch (action) {
      case 'next_details':
        {
          cubit_step1.checkUsername(username: cubit_step1.username.text);
          loadingScreen(context);
        }
    }
  }
}
