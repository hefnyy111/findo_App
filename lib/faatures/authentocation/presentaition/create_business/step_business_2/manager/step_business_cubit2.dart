// faatures/authentocation/presentaition/create_business/step_business_2/manager/step_business_cubit2.dart
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_1/manager/step_business_states1.dart';
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_2/manager/step_business_states2.dart';
import 'package:findo/shared/core/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class StepBusinessCubit2 extends Cubit<StepBusinessStates2> {
  StepBusinessCubit2() : super(StepBusinessInitialStates2());

  static StepBusinessCubit2 get(context) => BlocProvider.of(context);

  // ******************************* Variabels
  final full_name = TextEditingController();
  final National_id = TextEditingController();
  final phone = TextEditingController();
  final forkey = GlobalKey<FormState>();

  
   // ******************************* Change button
  bool startShimmer = false;
  Color buttonEnable = AppColors.kbutton_disabel;
  VoidCallback? functionButton;
   void changeButton(String? value, context, {VoidCallback? custom_functionButton}) {
    bool values = full_name.text.isNotEmpty && National_id.text.isNotEmpty && phone.text.isNotEmpty;
    if(values) {
       startShimmer = true;
       buttonEnable = AppColors.kPrimaryColor;
       functionButton = custom_functionButton;
    } else {
       startShimmer = false;
       buttonEnable = AppColors.kbutton_disabel;
       functionButton = null;
    }

    emit(StepBusinessChangeButtonStates2());
   } 
  
}