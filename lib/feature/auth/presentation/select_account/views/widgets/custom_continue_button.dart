// feature/auth/presentation/select_account/views/widgets/custom_continue_button.dart

import 'package:Ascend/feature/auth/presentation/select_account/Cubit/select_account_cubit.dart';
import 'package:Ascend/shared/Components/components.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CustomContinueButton extends StatelessWidget {
  const CustomContinueButton({super.key, required this.cubit_select});

  final SelectAccountCubit cubit_select;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Shimmer(
        duration: Duration(seconds: 4),
        interval: Duration(seconds: 1),
        color: Colors.white,
        colorOpacity: 1,
        enabled: cubit_select.startShimmer,
        direction: ShimmerDirection.fromLBRT(),
        child: customButton(
          function: cubit_select.functionButton,
          text: "Continue",
          colorBorderside: cubit_select.buttonEnable,
          backColor: cubit_select.buttonEnable,
          colorText: Colors.black,
          width: 180,
        ),
      ),
    );
  }
}
