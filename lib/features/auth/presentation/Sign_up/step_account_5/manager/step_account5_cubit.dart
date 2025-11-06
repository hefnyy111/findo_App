// features/auth/presentation/Sign_up/step_account_5/manager/step_account5_cubit.dart
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_5/manager/step_account5_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepAccount5Cubit extends Cubit<StepAccount5States> {

  StepAccount5Cubit() : super(StepAccount5InitialStates());

  static StepAccount5Cubit get(context) => BlocProvider.of(context);

   // ******************************* Inputs
   final forkey_step1 = GlobalKey<FormState>();
   final bio = TextEditingController();
} 