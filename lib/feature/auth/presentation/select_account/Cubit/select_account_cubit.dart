// faatures/auth/presentaition/select_account/Cubit/select_account_cubit.dart
import 'dart:ui';
import 'package:findo/faatures/auth/presentaition/select_account/Cubit/select_account_states.dart'
    show
        SelectAccountStates,
        SelectAccountInitialStates,
        SelectAccounChangeSelectStates;
import 'package:flutter/material.dart';
import 'package:findo/shared/core/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectAccountCubit extends Cubit<SelectAccountStates> {
  SelectAccountCubit() : super(SelectAccountInitialStates());

  static SelectAccountCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 0;
  bool startShimmer = false;
  Color buttonEnable = AppColors.kbutton_disabel;
  VoidCallback? functionButton;

  // ====================== select button ======================
  void changeSelection(int index, {VoidCallback? customFunction}) {
    selectedIndex = index;

    if (selectedIndex == 1) {
      startShimmer = true;
      functionButton = customFunction;
      buttonEnable = AppColors.kPrimaryColor;
    } else if (selectedIndex == 2) {
      startShimmer = true;
      functionButton = customFunction;
      buttonEnable = AppColors.kPrimaryColor;
    } else {
      startShimmer = false;
      functionButton = null;
      buttonEnable = AppColors.kbutton_disabel;
    }

    emit(SelectAccounChangeSelectStates());
  }
}
