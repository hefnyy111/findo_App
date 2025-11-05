import 'package:Ascend/features/auth/presentation/sign_in/manager/cubit/verify_code_cubit.dart';
import 'package:Ascend/features/auth/presentation/sign_in/phone/widgets/animated_otp_code.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class OtpCode extends StatelessWidget {
  const OtpCode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyCodeCubit, VerifyCodeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var verifycubit = VerifyCodeCubit.get(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOtPCode(
              digits: verifycubit.firstDigits,
              boxIndex: 1,
              controller: verifycubit.firstController,
              focusNode: verifycubit.firstFocusNode,
              onTap: () {
                verifycubit.activateBox(1);
                FocusScope.of(context).requestFocus(verifycubit.firstFocusNode);
              },
              borderColor: verifycubit.firstBorderColor,
            ),
            AnimatedOtPCode(
              digits: verifycubit.secondDigits,
              boxIndex: 2,
              controller: verifycubit.secondController,
              focusNode: verifycubit.secondFocusNode,
              onTap: () {
                verifycubit.activateBox(2);
                FocusScope.of(
                  context,
                ).requestFocus(verifycubit.secondFocusNode);
              },
              borderColor: verifycubit.secondBorderColor,
            ),
          ],
        );
      },
    );
  }
}
