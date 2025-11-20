// features/auth/presentation/Sign_up/step_account_3/manager/step_account3_states.dart
abstract class StepAccount3States {}

class StepAccount3InitialStates extends StepAccount3States {}

//================vaildate===================
class StepAccount3VaildateUserStates extends StepAccount3States {}

// =============== Add Photo ===============
class StepAccount3AddPhotoStates extends StepAccount3States {}

class ProfileImageSelected extends StepAccount3States {
  ProfileImageSelected(file);

}