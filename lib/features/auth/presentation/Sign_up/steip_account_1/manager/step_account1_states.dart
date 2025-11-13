// features/auth/presentation/Sign_up/steip_account_1/manager/step_account1_states.dart
abstract class StepAccount1States {}

class StepAccount1InitialStates extends StepAccount1States {}

// =============== Change button ===============
class StepAccount1ChangeButtonStates extends StepAccount1States {}
// =============== Username Api ===============
class StepAccount1UserLoadingStates extends StepAccount1States {}

class StepAccount1UserAvailableStates extends StepAccount1States {}

class StepAccount1UserIsTakenStates extends StepAccount1States {}

class StepAccount1UserErrorStates extends StepAccount1States {
  final String error;
  StepAccount1UserErrorStates(this.error);
}
