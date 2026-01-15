// features/auth/presentation/verify_code/manager/verify_code_states.dart
import 'package:Ascend/features/auth/data/models/verify_model/verify_code.dart';

abstract class VerifyCodeStates {}

class VerifyCodeInitialStates extends VerifyCodeStates {}
// =============== Animation Border code ===============
class VerifyCodeChangeCurrentBorderStates extends VerifyCodeStates {}

class VerifyCodeStartChecksBorderStates extends VerifyCodeStates {}

class VerifyCodeFinishChecksBorderStates extends VerifyCodeStates {}
// =============== Timer ===============
class VerifyCodeLoadingCodeStates extends VerifyCodeStates {}

class VerifyCodeStartCodeStates extends VerifyCodeStates {}

class VerifyCodeRunningStates extends VerifyCodeStates {
  VerifyCodeRunningStates(int secondes);
}

class VerifyCodeFinishCodeStates extends VerifyCodeStates {
  VerifyCodeFinishCodeStates(int secondes);
}

class VerifyCodeErrorCodeStates extends VerifyCodeStates {
  final String e;
  VerifyCodeErrorCodeStates(this.e);
}

//------------------- Check Code API ------------------- 
class VerificationCodeLoadingState extends VerifyCodeStates {}

class VerificationCodeSuccessGoHomeState extends VerifyCodeStates {}

class VerificationCodeSuccessGoRegisterState extends VerifyCodeStates {}

class VerificationCodeErrorState extends VerifyCodeStates {
  final String error;

  VerificationCodeErrorState(this.error);
}