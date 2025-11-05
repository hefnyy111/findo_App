import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  VerifyCodeCubit() : super(VerifyCodeInitial());

  static VerifyCodeCubit get(context) => BlocProvider.of(context);

  // Controllers & Focus
  final firstController = TextEditingController();
  final secondController = TextEditingController();
  final firstFocusNode = FocusNode();
  final secondFocusNode = FocusNode();

  // Digits for each box
  List<String> firstDigits = ["0", "0", "0"];
  List<String> secondDigits = ["0", "0", "0"];

  // Active colors
  bool isFirstActive = false;
  bool isSecondActive = false;

  Color get firstBorderColor =>
      isFirstActive ? AppColors.kPrimaryColor : AppColors.kGreyColor;

  Color get secondBorderColor =>
      isSecondActive ? AppColors.kPrimaryColor : AppColors.kGreyColor;

  void activateBox(int index) {
    if (index == 1) {
      isFirstActive = true;
      isSecondActive = false;
      firstFocusNode.requestFocus();
      secondFocusNode.unfocus();
      emit(VerifyCodeDone());
    } else {
      isFirstActive = false;
      isSecondActive = true;
      secondFocusNode.requestFocus();

      firstFocusNode.unfocus();
      emit(VerifyCodeDone());
    }
  }

  //  Handle number input
  void handleInputChange(String value, int boxIndex) {
    final digits = boxIndex == 1 ? firstDigits : secondDigits;

    for (int i = 0; i < 3; i++) {
      if (i < value.length) {
        digits[i] = value[i];
      } else {
        digits[i] = "0";
      }
    }
    if (boxIndex == 1) {
      isFirstActive = value.isNotEmpty;
    } else {
      isSecondActive = value.isNotEmpty;
    }
    emit(VerifyCodeDone());

    if (value.length == 3 && boxIndex == 1) {
      activateBox(2);
    }

    if (firstController.text.length == 3 && secondController.text.length == 3) {
      checkCode();
    } else {
      isCodeAttempted = false;
      isCodeValid = false;
      emit(VerifyCodeDigitsUpdated());
    }
  }

  //check code
  bool isCodeValid = false;
  bool isCodeAttempted = false;
  bool enabledShimmer = false;
  void checkCode() async {
    isCodeAttempted = false;
    isCodeValid = false;
    enabledShimmer = true;

    emit(VerifyCodeLoading());

    await Future.delayed(const Duration(seconds: 2));

    final enteredCode = firstController.text + secondController.text;

    enabledShimmer = false;
    isCodeAttempted = true;

    if (enteredCode == "123456") {
      isCodeValid = true;
    } else {
      isCodeValid = false;
    }

    emit(VerifyCodeValidationResult());
  }
}
