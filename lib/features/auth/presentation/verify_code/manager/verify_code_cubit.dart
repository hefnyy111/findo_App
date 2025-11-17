// features/auth/presentation/verify_code/manager/verify_code_cubit.dart
import 'package:Ascend/features/auth/presentation/verify_code/manager/verify_code_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeStates> {
  VerifyCodeCubit() : super(VerifyCodeInitialStates());

  static VerifyCodeCubit get(context) => BlocProvider.of(context);
  

  List<TextEditingController> controllers = [];
  List<FocusNode> FocusNodee = [];
  
  void initFields() {
    controllers = List.generate(6, (_) => TextEditingController());
    FocusNodee = List.generate(6, (_) => FocusNode());
  }

  void codeField(context, String? value, int index) {
    if(value!.isNotEmpty && index < 5) {
      FocusScope.of(context).requestFocus(FocusNodee[index + 1]);
    } else if (value.isNotEmpty && index > 0) {
      FocusScope.of(context).requestFocus(FocusNodee[index - 1]);
    }
  }
}