// features/auth/presentation/Sign_up/step_account_4/manager/step_account4_states.dart
abstract class StepAccount4States {}

class StepAccount4InitialStates extends StepAccount4States {}

// =============== Change button ===============
class StepAccount4ChangeButtonStates extends StepAccount4States {}

// =============== Create accoun api ===============
class StepAccount4LoadingAccountStates extends StepAccount4States {}

class StepAccount4SuccessAccountStates extends StepAccount4States {}

class StepAccount4ErrorAccountStates extends StepAccount4States {
  final String error;
  StepAccount4ErrorAccountStates(this.error);
}

