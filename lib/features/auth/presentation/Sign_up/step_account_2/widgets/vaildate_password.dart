// features/auth/presentation/Sign_up/step_account_2/widgets/vaildate_password.dart

import 'package:Ascend/features/auth/presentation/Sign_up/step_account_2/manager/step_account2_cubit.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VaidatePassWord extends StatelessWidget {
  const VaidatePassWord({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit_step2 = StepAccount2Cubit.get(context);
    return Column(
      children: [
        CustomVaidateUser(
          condition: cubit_step2.hasLower,
          text: "At least one lowercase letter",
        ),
        const SizedBox(height: 6),
        CustomVaidateUser(
          condition: cubit_step2.hasUpper,
          text: "At least one uppercase letter",
        ),
        const SizedBox(height: 6),
        CustomVaidateUser(
          condition: cubit_step2.hasNumber,
          text: "At least one number",
        ),
        const SizedBox(height: 6),
        CustomVaidateUser(
          condition: cubit_step2.hasMinLength,
          text: "Minimum 8 characters",
        ),
        const SizedBox(height: 6),
      ],
    );
  }
}


// ******************************* Custom Validate password

class CustomVaidateUser extends StatelessWidget {
  const CustomVaidateUser({ super.key, required this.condition, required this.text, });
  final bool condition;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        condition
            ? Icon(Icons.check_circle, color: AppColors.kPrimaryColor, size: 15)
            : Icon(Icons.cancel, color: AppColors.kGreyColor, size: 15),

        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: condition ? AppColors.kPrimaryColor : AppColors.kGreyColor,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
