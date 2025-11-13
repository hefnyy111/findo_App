// features/auth/presentation/Sign_up/step_account_4/manager/step_account4_cubit.dart
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_4/manager/step_account4_states.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepAccount4Cubit extends Cubit<StepAccount4States> {

  StepAccount4Cubit() : super(StepAccount4InitialStates());

  static StepAccount4Cubit get(context) => BlocProvider.of(context);

   // ******************************* Inputs
   final forkey_step1 = GlobalKey<FormState>();
   final bio = TextEditingController();

     // ******************************* Change button
  Color backGround_button = AppColors.kbutton_disabel;
  Color borderSide_button = AppColors.kbutton_disabel;
  Color text_button = AppColors.kGreyColor;
  bool shimmer_button = false;
  VoidCallback? onpressed_button;

  void changeButton(String? value, { VoidCallback? onClickButton }) {
  bool isVaild = bio.text.isNotEmpty;
  if(isVaild) {
  backGround_button = AppColors.kPrimaryColor;
  borderSide_button = AppColors.kPrimaryColor;
  text_button = Colors.white;
  shimmer_button = true;
  onpressed_button = onClickButton;
  } else {
  backGround_button = AppColors.kbutton_disabel;
  borderSide_button =AppColors.kbutton_disabel;
  text_button = AppColors.kGreyColor;
  shimmer_button = false;
  onpressed_button = null;
  }
   emit(StepAccount4ChangeButtonStates());
  }
  
} 