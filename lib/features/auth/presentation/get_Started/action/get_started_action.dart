// features/auth/presentation/get_Started/action/get_started_action.dart

import 'package:Ascend/shared/Components/components.dart';
import 'package:Ascend/shared/core/constants/app_router.dart';
import 'package:go_router/go_router.dart';

class GetStartedAction {
  static void getStartedButtonPress(context, String? action) async {
    switch(action) {

      case 'go_getStarted': {
        print('ts');
        await loadingScreen(context, 3);
         GoRouter.of(context).push(AppRouter.kSignInView);
      }
      break;

      case 'go_signIn': {
     
      }
    }
  }
}