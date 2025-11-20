// features/auth/presentation/sign_in/phone/widgets/sign_in_fieldPicker.dart
import 'package:Ascend/features/auth/presentation/sign_in/action/sign_in_action.dart';
import 'package:Ascend/features/auth/presentation/sign_in/manager/sign_in_cubit.dart';
import 'package:Ascend/features/auth/presentation/sign_in/manager/sign_in_states.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit_signin = SignInCubit.get(context);
        return GestureDetector(
          onTap: () => SignInAction.signInButtonPress(context, "go_countries"),
          child: Container(
            height: 45.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(color: AppColors.kGreyColor, width: 0.8),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ******************************* Text
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    cubit_signin.selectCountry ?? "Select country",
                    style: TextStyle(
                      color: cubit_signin.colorCountry ??  AppColors.kGreyColor,
                      fontSize: 14, 
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const Spacer(),

                // ******************************* Icon
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: cubit_signin.selectCountry == true ? Colors.white : AppColors.kGreyColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}