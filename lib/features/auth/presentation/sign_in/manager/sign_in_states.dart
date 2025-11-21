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
// ================ Email API ================
class SigninLoadingEmailStates extends SignInStates {}

class SigninSuccessEmailStates extends SignInStates {}

class SigninErrorEmailStates extends SignInStates {
  final String error;
  SigninErrorEmailStates(this.error);
}

// ================ Phone API ================
class SigninLoadingPhoneOTPStates extends SignInStates {}

class SigninVerifiedPhoneOTPStates extends SignInStates {}

class SigninSuccessPhoneOTPStates extends SignInStates {}

class SigninErrorPhoneOTPtates extends SignInStates {
  final String error;
  SigninErrorPhoneOTPtates(this.error);
}