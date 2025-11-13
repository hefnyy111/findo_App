// import 'package:Ascend/features/auth/presentation/Sign_up/step_account_2/manager/step_account2_states.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class StepAccount2Cubit extends Cubit<StepAccount2States> {
//   StepAccount2Cubit() : super(StepAccount2InitialStates());

//   static StepAccount2Cubit get(context) => BlocProvider.of(context);

//   // ******************************* Inputs
//   final password = TextEditingController();
//   final confirm_password = TextEditingController();

//   //**************************** vaildate passWord
//   bool isvaild1 = false;
//   bool isvaild2 = false;
//   bool isvaild3 = false;
//   bool isvaild4 = false;
//   validatePassWord(String value) {
//     if (value.length < 8) {
//       isvaild1 = true;
//       return 'passWord is contain 8 digits';
//     } else if (!value.contains(RegExp(r'[a-z]'), 1)) {
//       isvaild2 = true;
//       return 'At Least one LowerCase Latter';
//     } else if (!value.contains(RegExp(r'[A-Z]'), 2)) {
//       isvaild3 = true;
//       return 'At Least Two UpperCase Latters';
//     } else if (!value.contains(RegExp(r'[0-9]'), 1)) {
//       isvaild4 = true;
//       return 'At Least one Number Latter';
//     }
//   }
// }
