// features/auth/presentation/sign_in/manager/sign_in_states.dart
abstract class SignInStates {}

class SignInInitialStates extends SignInStates {}

// ================ Select Email OR Phoen ================
class SignInSelectButtonStates extends SignInStates {}
// ================ Select Country  ================
class SignInSelectCountryStates extends SignInStates {}
// ================ Show search  ================
class SignInShowSearchStates extends SignInStates {}

class SignInUpdateSearchStates extends SignInStates {}
// ================ Change button  ================
class SigninChangeButtonStates extends SignInStates {}