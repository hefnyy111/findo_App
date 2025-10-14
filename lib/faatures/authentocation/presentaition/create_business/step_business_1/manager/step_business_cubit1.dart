// faatures/authentocation/presentaition/create_business/step_business_1/manager/step_business_cubit1.dart
import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_1/manager/step_business_states1.dart';
import 'package:findo/shared/core/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
class StepBusinessCubit1 extends Cubit<StepBusinessStates1> {
  StepBusinessCubit1() : super(StepBusinessInitialStates());

  static StepBusinessCubit1 get(context) => BlocProvider.of(context);
    // ******************************* Variabels
    final step1_forKey = GlobalKey<FormState>();
    final controller_1 = TextEditingController();
    final controller_2 = TextEditingController();

   // ******************************* Change button
  bool startShimmer = false;
  Color buttonEnable = AppColors.kbutton_disabel;
  VoidCallback? functionButton;
   void changeButton(String? value, context, {VoidCallback? custom_functionButton}) {
    bool values = controller_1.text.isNotEmpty && controller_2.text.isNotEmpty;
    if(values) {
       startShimmer = true;
       buttonEnable = AppColors.kPrimaryColor;
       functionButton = custom_functionButton;
    } else {
       startShimmer = false;
       buttonEnable = AppColors.kbutton_disabel;
       functionButton = null;
    }

    emit(StepBusinessChangeButtonStates());
   } 
}