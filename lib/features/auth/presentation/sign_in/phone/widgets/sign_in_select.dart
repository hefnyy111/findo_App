// features/auth/presentation/sign_in/phone/widgets/sign_in_select.dart
import 'package:Ascend/features/auth/presentation/sign_in/manager/sign_in_cubit.dart';
import 'package:Ascend/features/auth/presentation/sign_in/manager/sign_in_states.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit_signin = SignInCubit.get(context);
        return Container(
          width: double.infinity,
          height: 45.0,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: AppColors.kbackGroundField,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),

          child: Row(
            children: [
              // ******************************* Phoen
              Expanded(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: cubit_signin.isPhoeSelected ? AppColors.kPrimaryColor : AppColors.kbackGroundField,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(25.0),
                    ),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(double.infinity, double.infinity),
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      cubit_signin.toggleSelected(true);
                      
                    },
                    child: Text(
                      'Phone',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: cubit_signin.isPhoeSelected ? 15 : 13,
                      ),
                    ),
                  ),
                ),
              ),
              // ******************************* Email
              Expanded(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color:
                        cubit_signin.isPhoeSelected
                            ? AppColors.kbackGroundField
                            : AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(25.0),
                    ),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(double.infinity, double.infinity),
                    ),
                    onPressed: () {
                      cubit_signin.toggleSelected(false);
                    },
                    child: Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: cubit_signin.isPhoeSelected ? 13 : 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
