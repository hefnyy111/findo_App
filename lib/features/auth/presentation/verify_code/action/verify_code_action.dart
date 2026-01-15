import 'package:Ascend/features/auth/presentation/verify_code/manager/verify_code_cubit.dart';

class VerifyCodeAction {
  static void handleVerifyCode( context, value, realIndex, String? action,
  ) async {
    var cubitVerify = VerifyCodeCubit.get(context);
    switch (action) {
      case 'verify_code':
        {
          cubitVerify.codeField(context, value, realIndex);
        }
    }
  }
}
