// faatures/authentocation/presentaition/create_business/step_business_5/manager/step_business_cubit5.dart
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_5/manager/step_business_states5.dart';
import 'package:findo/shared/core/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class StepBusinessCubit5 extends Cubit<StepBusinessStates5> {
  StepBusinessCubit5() : super(StepBusinessInitialStates5());

  static StepBusinessCubit5 get(context) => BlocProvider.of(context);

      // ******************************* Variabels
  final description = TextEditingController();
  final forkey = GlobalKey<FormState>();

 // ******************************* Change button
  bool startShimmer = false;
  Color buttonEnable = AppColors.kbutton_disabel;
  VoidCallback? functionButton;
   void changeButton(String? value, context, {VoidCallback? custom_functionButton}) {
    bool values = description.text.isNotEmpty;
    if(values) {
       startShimmer = true;
       buttonEnable = AppColors.kPrimaryColor;
       functionButton = custom_functionButton;
    } else {
       startShimmer = false;
       buttonEnable = AppColors.kbutton_disabel;
       functionButton = null;
    }

    emit(StepBusinessChangeButtonStates5());
   } 
}