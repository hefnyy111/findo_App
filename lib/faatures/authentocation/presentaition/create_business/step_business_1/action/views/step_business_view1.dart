import 'package:findo/faatures/authentocation/presentaition/create_business/step_business_1/action/views/widgets/custom_raw.dart';
import 'package:findo/faatures/authentocation/presentaition/select_account/Cubit/select_account_cubit.dart';
import 'package:findo/faatures/authentocation/presentaition/select_account/Cubit/select_account_states.dart'
    show SelectAccountStates;
import 'package:findo/faatures/authentocation/presentaition/select_account/action/views/widgets/custom_continue_button.dart';
import 'package:findo/shared/Components/components.dart';
import 'package:findo/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/step_progress.dart';

class StepBusinessView1 extends StatelessWidget {
  const StepBusinessView1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectAccountCubit(),
      child: BlocConsumer<SelectAccountCubit, SelectAccountStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit_select = SelectAccountCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  Center(
                    //============= Title ==============
                    child: Text(
                      'Findo',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'For Business',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 40),
                  //============= Step Progress Indicator=============
                  StepProgress(currentStep: 1, totalSteps: 5),
                  SizedBox(height: 20),
                  //============= Findo & Activity ==============
                  Text(
                    'Findo &  Activity',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),

                  //============= Tell us about your Business ==============
                  Text(
                    'Tell us about your Business',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kGreyColor,
                    ),
                  ),
                  SizedBox(height: 15),
                  customTextFormField(
                    controller: TextEditingController(),
                    validate: (p0) {},
                    onChanged: (value) {},
                    text: 'Business Name',
                  ),
                  SizedBox(height: 30),
                  //============= Business Category ==============
                  Text(
                    'Business Category',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kGreyColor,
                    ),
                  ),
                  SizedBox(height: 15),
                  customTextFormField(
                    controller: TextEditingController(),
                    validate: (p0) {},
                    onChanged: (value) {},
                    text: 'Select a Category',
                  ),
                  SizedBox(height: 30),

                  SizedBox(height: 100),
                  //============= Continue Button ==============
                  CustomContinueButton(cubit_select: cubit_select),
                  CustomRow(
                    text1: 'Already have an account?',
                    text2: 'Sign In',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
