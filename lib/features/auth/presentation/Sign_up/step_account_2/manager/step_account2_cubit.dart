// features/auth/presentation/Sign_up/step_account_2/manager/step_account2_cubit.dart
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_2/manager/step_account2_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:Ascend/shared/core/constants/constants.dart';

class StepAccount2Cubit extends Cubit<StepAccount2States> {
  StepAccount2Cubit() : super(StepAccount2InitialStates());

  static StepAccount2Cubit get(context) => BlocProvider.of(context);

  // ******************************* Inputs
  final password = TextEditingController();
  final confirm_password = TextEditingController();

  // ******************************* Change button
  Color backGround_button = AppColors.kbutton_disabel;
  Color borderSide_button = AppColors.kbutton_disabel;
  Color text_button = AppColors.kGreyColor;
  bool shimmer_button = false;
  VoidCallback? onpressed_button;

  void changeButton(String? value, {VoidCallback? onClickButton}) {
    bool isVaild = password.text.isNotEmpty && confirm_password.text.isNotEmpty;
    bool isPasswordValid = hasLower && hasUpper && hasNumber && hasMinLength;

    if (isVaild && isPasswordValid) {
      backGround_button = AppColors.kPrimaryColor;
      borderSide_button = AppColors.kPrimaryColor;
      text_button = Colors.white;
      shimmer_button = true;
      onpressed_button = onClickButton;
    } else {
      
      backGround_button = AppColors.kbutton_disabel;
      borderSide_button = AppColors.kbutton_disabel;
      text_button = AppColors.kGreyColor;
      shimmer_button = false;
      onpressed_button = null;
    }
    emit(StepAccount2ChangeButtonStates());
  }

  //**************************** vaildate passWord
  bool hasMinLength = false;
  bool hasLower = false;
  bool hasUpper = false;
  bool hasNumber = false;

   void validatePassword(String value) {
    hasMinLength = value.length >= 8;
    hasLower = RegExp(r'[a-z]').hasMatch(value);
    hasUpper = RegExp(r'[A-Z]').hasMatch(value);
    hasNumber = RegExp(r'[0-9]').hasMatch(value);

    emit(StepAccount2VaildateUserStates());
  }
}
