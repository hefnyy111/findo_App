// features/auth/presentation/Sign_up/step_account_2/manager/step_account2_cubit.dart
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_2/manager/step_account2_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepAccount2Cubit extends Cubit<StepAccount2States> {

  StepAccount2Cubit() : super(StepAccount2InitialStates());

  static StepAccount2Cubit get(context) => BlocProvider.of(context);

   // ******************************* Inputs
   final password = TextEditingController();
   final confirm_password = TextEditingController();
} 