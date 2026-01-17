// features/auth/presentation/verify_code/manager/verify_code_cubit.dart
import 'dart:async';

import 'package:Ascend/features/auth/data/models/verify_model/verify_code.dart';
import 'package:Ascend/features/auth/presentation/sign_in/manager/sign_in_cubit.dart';
import 'package:Ascend/features/auth/presentation/verify_code/manager/verify_code_states.dart';
import 'package:Ascend/shared/Components/components.dart';
import 'package:Ascend/shared/core/constants/app_router.dart';
import 'package:Ascend/shared/network/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeStates> {
  VerifyCodeCubit() : super(VerifyCodeInitialStates());

  static VerifyCodeCubit get(context) => BlocProvider.of(context);
  
  // ******************************* Variabels
  List<TextEditingController> controllers = [];
  List<FocusNode> FocusNodee = [];
  int currentBorder = 1;
  bool startShimmer = false;
  bool showCodeIncorrect = false;
  bool showCodeSuccess = false;
  Timer? timer;
  bool showTimerr = false;
  int secondes = 60;
  
  // ******************************* Initial Fields
  void initFields() {
    controllers = List.generate(6, (_) => TextEditingController());
    FocusNodee = List.generate(6, (_) => FocusNode());
  }
   
   // ******************************* Checks fields 
    String get otpCode => controllers.map((e) => e.text).join();
  void codeField(BuildContext context, String? value, int index) {
  // Border
  currentBorder = (index <= 2) ? 1 : 2;
  emit(VerifyCodeChangeCurrentBorderStates());

  // Focus control
  if (value != null && value.isNotEmpty && index < 5) {
    FocusScope.of(context).requestFocus(FocusNodee[index + 1]);
  } else if (value != null && value.isEmpty && index > 0) {
    FocusScope.of(context).requestFocus(FocusNodee[index - 1]);
  }

  // آخر خانة
  if (index == 5 && value != null && value.isNotEmpty) {
    // نأجل التنفيذ علشان controller يتحدث
    Future.delayed(Duration.zero, () {
      final otp = otpCode;

      print('OTP SENT => [$otp]'); // Debug

      verifyCode(
        email: SignInCubit.get(context).email.text.trim(),
        code: otp,
      ).then((isValid) {
        checkCode(context, isValid);
      });
    });
  }
}
 
  
  // ******************************* Api verify code ( Email )
Future<bool> verifyCode({required String email, required String code}) async {
  emit(VerificationCodeLoadingState());

  try {
    final response = await DioHelper.postData(
      url: "verify_email",
      data: {
        "email": email,
        "code": code,
      },
    );

    final verifyCodeModel = VerifyEmailResponse.fromJson(response.data);

    if (verifyCodeModel.nextStep == "home") {
      print('Go Home');
      emit(VerificationCodeSuccessGoHomeState());
      return true;
    } else if (verifyCodeModel.nextStep == "register") {
      print('Go Register');
      emit(VerificationCodeSuccessGoRegisterState());
      return true;
      
    } else {
      return false;
    }
  } catch (er) {
       print('VERIFY ERROR => $er');
    emit(VerificationCodeErrorState(er.toString()));
    return false;
  }
}

 // ******************************* Api verify code ( Phone )
 Future<bool> verifyCodePhone({required String phone, required String code}) async {

 }

  // ******************************* Ckeck code

  void checkCode(context, isValid) async {
    startShimmer = true;
    currentBorder = 0;
    emit(VerifyCodeStartChecksBorderStates());
   
   await Future.delayed(Duration(seconds: 3));
   if(isValid) {
    print(isValid);
    startShimmer = false;
    showCodeSuccess = true;
    Future.delayed(Duration(seconds: 4), () async {
      print('success');
    
    });
   } else {
    showCodeIncorrect = true;
    startShimmer = false;
    print('failed');
    for(var controller in controllers) {
      controller.clear();
    }
    FocusScope.of(context).requestFocus(FocusNodee[0]);
   }

   emit(VerifyCodeFinishChecksBorderStates());

  }



  // ******************************* StartTimer
  void startTimeer() {
    showTimerr = true;
    secondes = 60;
    emit(VerifyCodeStartCodeStates());
    
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
     if(secondes > 0) {
       secondes--;
       emit(VerifyCodeRunningStates(secondes));
     } else {
       showTimerr = false;
       timer.cancel();
       emit(VerifyCodeFinishCodeStates(secondes));
     }
    });
  }

}