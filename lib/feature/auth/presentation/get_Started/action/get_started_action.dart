// feature/auth/presentation/get_Started/action/get_started_action.dart
import 'package:Ascend/shared/core/constants/app_router.dart';
import 'package:go_router/go_router.dart';

class GetStartedAction {
  static void getStartedButtonPress(context, String? action) {
    switch(action) {

      case 'go_getStarted': {
        print('ts');
         GoRouter.of(context).go(AppRouter.kSelectAccountView);
      }
      break;

      case 'go_signIn': {
     
      }
    }
  }
}