import 'package:Ascend/features/auth/presentation/get_Started/get_started_view.dart';
import 'package:Ascend/features/auth/presentation/verify_code/manager/verify_code_cubit.dart';
import 'package:Ascend/shared/Components/components.dart';

class VerifyCodeAction {
  static void handleVerifyCode( context, String? action, {value, realIndex,}
  ) async {
    var cubitVerify = VerifyCodeCubit.get(context);
    switch (action) {
      // ******************************* Code Field
      case 'verify_code':
        {
          cubitVerify.codeField(context, value, realIndex);
        }

        break;
      // ******************************* Back to GetStarted
      case 'back_getstarted':
        {
          
          navigatorAndFinish(context, GetStartedView());
        }
    }
  }
}
