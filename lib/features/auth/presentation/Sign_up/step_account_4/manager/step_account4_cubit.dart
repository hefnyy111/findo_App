// features/auth/presentation/Sign_up/step_account_4/manager/step_account4_cubit.dart
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_4/manager/step_account4_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepAccount4Cubit extends Cubit<StepAccount4States> {

  StepAccount4Cubit() : super(StepAccount4InitialStates());

  static StepAccount4Cubit get(context) => BlocProvider.of(context);

   // ******************************* Inputs
   final photo = TextEditingController();
} 