import 'package:Ascend/shared/core/utlis/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  VerifyCodeCubit() : super(VerifyCodeInitial());

  static VerifyCodeCubit get(context) => BlocProvider.of(context);
  // ******************************* Variabels
  final formKey = GlobalKey<FormState>();
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  // ******************************* Change button
  bool startShimmer = false;
  Color buttonEnable = AppColors.kbutton_disabel;
  VoidCallback? functionButton;
  void changeButton(
    String? value,
    context, {
    VoidCallback? custom_functionButton,
  }) {
    bool values = controller1.text.isNotEmpty && controller2.text.isNotEmpty;
    if (values) {
      startShimmer = true;
      buttonEnable = AppColors.kPrimaryColor;
      functionButton = custom_functionButton;
    } else {
      startShimmer = false;
      buttonEnable = AppColors.kbutton_disabel;
      functionButton = null;
    }

    emit(VerifyCodeDone());
  }

  // ******************************* Active Container
  bool isActive = false;
  
}
