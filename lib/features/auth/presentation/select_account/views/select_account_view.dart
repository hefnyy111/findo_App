// feature/auth/presentation/select_account/views/select_account_view.dart


import 'package:Ascend/features/auth/presentation/select_account/Cubit/select_account_cubit.dart';
import 'package:Ascend/features/auth/presentation/select_account/Cubit/select_account_states.dart';
import 'package:Ascend/features/auth/presentation/select_account/views/widgets/custom_continue_button.dart' show CustomContinueButton;
import 'package:Ascend/features/auth/presentation/select_account/views/widgets/custom_select_acount.dart';
import 'package:Ascend/features/auth/presentation/select_account/views/widgets/progress_indicator.dart';
import 'package:Ascend/shared/Components/custom_buttonNavigation.dart';

import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectAccountView extends StatelessWidget {
  const SelectAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectAccountCubit(),
      child: BlocConsumer<SelectAccountCubit, SelectAccountStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit_select = SelectAccountCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.black,

            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ====================== Sizebox ======================
                  const SizedBox(height: 100.0),
                  // ====================== Findo ======================
                  const Text(
                    'Findo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'SF-Pro-Rounded-Bold',
                      color: AppColors.kPrimaryColor,
                      fontSize: 32,
                    ),
                  ),
                  // ====================== Sizebox ======================
                  const SizedBox(height: 40.0),
                  // ====================== Create your account =====================
                  const Text(
                    'Create Your Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'SF-Pro-Rounded-Bold',
                      color: Color.fromARGB(255, 233, 227, 227),
                      fontSize: 27,
                    ),
                  ),
                  // ====================== Sizebox ======================
                  const SizedBox(height: 15.0),
                  // ====================== What brings you here ======================
                  const Text(
                    'What brings you here?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.ksubTitle,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  ),
                  // ====================== Sizebox ======================
                  const SizedBox(height: 60.0),
                  // ====================== Select accounts ======================
                  CustomSelectAcount(cubit_select: cubit_select),
                  // ====================== Sizebox ======================
                  const SizedBox(height: 100.0),
                  // ====================== Button ======================
                  CustomContinueButton(cubit_select: cubit_select),
                  // ====================== Sizebox ======================
                  const SizedBox(height: 30.0),
                  // ====================== OnBoarding ======================
                  CustomProgressIndicator(cubit_select: cubit_select),

                  // ====================== Sizebox ======================
                  const SizedBox(height: 20.0),
                ],
              ),
            ),

            // ====================== Button naviage =====================
            bottomNavigationBar: CustomButtomNavigationBar(
              text1: 'Have an acount Already',
              text2: 'Sign In',
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
