// features/auth/presentation/Sign_up/steip_account_1/manager/step_account1_cubit.dart
import 'package:Ascend/features/auth/presentation/Sign_up/steip_account_1/manager/step_account1_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepAccount1Cubit extends Cubit<StepAccount1States> {

  StepAccount1Cubit() : super(StepAccount1InitialStates());

  static StepAccount1Cubit get(context) => BlocProvider.of(context);

   // ******************************* Inputs
   final full_name = TextEditingController();
   final username = TextEditingController();
} 