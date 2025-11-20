// features/auth/presentation/verify_code/manager/verify_code_states.dart
abstract class VerifyCodeStates {}

class VerifyCodeInitialStates extends VerifyCodeStates {}

class VerifyCodeChangeCurrentBorderStates extends VerifyCodeStates {}

class VerifyCodeStartChecksBorderStates extends VerifyCodeStates {}

class VerifyCodeFinishChecksBorderStates extends VerifyCodeStates {}
