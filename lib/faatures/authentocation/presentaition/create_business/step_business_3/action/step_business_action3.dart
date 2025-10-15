// faatures/authentocation/presentaition/create_business/step_business_3/action/step_business_action3.dart
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_4/step_business_view4.dart';
import 'package:findo/shared/core/constants/app_router.dart';
import 'package:go_router/go_router.dart';

class StepBusinessAction3 {
  static void StepBusiness3ButtonPress(context, String? action, { String? value}) {

    switch(action) {
      case 'go_step4': {
        GoRouter.of(context).go(AppRouter.kStepCreateBusiness4);
      }
      
      break;
      case "select_location": {
      
      }
    }
  }
}