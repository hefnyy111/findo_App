// faatures/authentocation/presentaition/create_business/step_business_4/manager/step_business_cubit4.dart
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_4/manager/step_business_states4.dart';
import 'package:findo/shared/core/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';


class StepBusinessCubit4 extends Cubit<StepBusinessStates4> {
  StepBusinessCubit4() : super(StepBusinessInitialStates4());

  static StepBusinessCubit4 get(context) => BlocProvider.of(context);

    // ******************************* Variabels
  final email = TextEditingController();
  final password = TextEditingController();
  final passwordRepeat = TextEditingController();
  final forkey = GlobalKey<FormState>();

     // ******************************* Change button
  bool startShimmer = false;
  Color buttonEnable = AppColors.kbutton_disabel;
  VoidCallback? functionButton;
   void changeButton(String? value, context, {VoidCallback? custom_functionButton}) {
    bool values = email.text.isNotEmpty && password.text.isNotEmpty && passwordRepeat.text.isNotEmpty;
    if(values) {
       startShimmer = true;
       buttonEnable = AppColors.kPrimaryColor;
       functionButton = custom_functionButton;
    } else {
       startShimmer = false;
       buttonEnable = AppColors.kbutton_disabel;
       functionButton = null;
    }

    emit(StepBusinessChangeButtonStates4());
   } 
     

     // ******************************* Api
     
}