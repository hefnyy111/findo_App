// features/auth/presentation/Sign_up/step_account_1/manager/step_account1_cubit.dart
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_1/manager/step_account1_states.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:Ascend/shared/network/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepAccount1Cubit extends Cubit<StepAccount1States> {

  StepAccount1Cubit() : super(StepAccount1InitialStates());

  static StepAccount1Cubit get(context) => BlocProvider.of(context);
  

   // ******************************* Inputs
   final full_name = TextEditingController();
   final username = TextEditingController();

   // ******************************* Change button
  Color backGround_button = AppColors.kbutton_disabel;
  Color borderSide_button = AppColors.kbutton_disabel;
  Color text_button = AppColors.kGreyColor;
  bool shimmer_button = false;
  VoidCallback? onpressed_button;

  void changeButton(String? value, { VoidCallback? onClickButton }) {
  bool isVaild = username.text.isNotEmpty;
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
   emit(StepAccount1ChangeButtonStates());
  }
  
  // ******************************* Text Api
void checkUsername({ required String username }) async {
  emit(StepAccount1UserLoadingStates());

  try {
    final response = await DioHelper.postData(
      url: "validate_user",
      data: {
        "username": username,
      },
    );

    print(response.data); 

    if (response.data['available'] == true) {
      emit(StepAccount1UserAvailableStates()); // لو اليوزر محدش عمله قبل كدا
    } else {
      emit(StepAccount1UserIsTakenStates()); // لو اليوزر حد عمله قبل كدا
    }
  } catch (e) {
    print('error: $e');
    emit(StepAccount1UserErrorStates(e.toString()));
  }
}
} 