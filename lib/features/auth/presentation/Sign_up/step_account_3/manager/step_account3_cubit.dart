// features/auth/presentation/Sign_up/step_account_3/manager/step_account3_cubit.dart
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/manager/step_account3_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepAccount3Cubit extends Cubit<StepAccount3States> {

  StepAccount3Cubit() : super(StepAccount3InitialStates());

  static StepAccount3Cubit get(context) => BlocProvider.of(context);

   // ******************************* Inputs
   final username = TextEditingController();
} 