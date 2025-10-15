// faatures/authentocation/presentaition/create_business/step_business_3/manager/step_business_cubit3.dart
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_3/manager/step_business_states3.dart';
import 'package:findo/shared/core/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';


class StepBusinessCubit3 extends Cubit<StepBusinessStates3> {
  StepBusinessCubit3() : super(StepBusinessInitialStates3());

  static StepBusinessCubit3 get(context) => BlocProvider.of(context);

    // ******************************* Variabels
  final area = TextEditingController();
  final address = TextEditingController();
  final forkey = GlobalKey<FormState>();

     // ******************************* Change button
  bool startShimmer = false;
  Color buttonEnable = AppColors.kbutton_disabel;
  VoidCallback? functionButton;
   void changeButton(String? value, context, {VoidCallback? custom_functionButton}) {
    bool values = area.text.isNotEmpty && address.text.isNotEmpty;
    if(values) {
       startShimmer = true;
       buttonEnable = AppColors.kPrimaryColor;
       functionButton = custom_functionButton;
    } else {
       startShimmer = false;
       buttonEnable = AppColors.kbutton_disabel;
       functionButton = null;
    }

    emit(StepBusinessChangeButtonStates3());
   } 

}