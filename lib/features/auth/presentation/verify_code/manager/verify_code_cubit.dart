// features/auth/presentation/verify_code/manager/verify_code_cubit.dart
import 'dart:async';

import 'package:Ascend/features/auth/presentation/verify_code/manager/verify_code_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  void codeField(context, String? value, int index) {
    if(index >= 0 && index <= 2 ) { // لو فاول خانة او الخانة التالتة البوردر يتحط علي اول خانة
      currentBorder = 1;
    } else {
      currentBorder = 2;            // العكس يروح علي تاني بوردر
    }
    emit(VerifyCodeChangeCurrentBorderStates());

    if(value!.isNotEmpty && index < 5) {  
      FocusScope.of(context).requestFocus(FocusNodee[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(FocusNodee[index - 1]);
    }
    if(index == 5 && value.isNotEmpty) { // لو وصلنا لاخر رقم في الكود يبدأ يتشك بقا
      checkCode(context);
      showCodeIncorrect = false;
    }
  }
 
  // ******************************* Ckeck code
  String get otpCode => controllers.map((e) => e.text).join();
  void checkCode(context) async {
    // هنا بعد مدخلت اخر رقم البوردر side يتشال وال شميير يبدأ يشتغل
    startShimmer = true;
    currentBorder = 0;
    emit(VerifyCodeStartChecksBorderStates());
    print(otpCode);

   await Future.delayed(Duration(seconds: 3), () {
   if(otpCode == "123456") {
    startShimmer = false;
    showCodeSuccess = true;
    Future.delayed(Duration(seconds: 4), () {
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
    });
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