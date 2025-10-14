
import 'package:findo/shared/core/constants/constants.dart' show AppColors;

import '../../../Cubit/select_account_cubit.dart';
import 'package:flutter/material.dart';


class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key, required this.cubit_select});

  final SelectAccountCubit cubit_select;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.circle,
          color:
              cubit_select.selectedIndex == 1
                  ? AppColors.kPrimaryColor
                  : AppColors.kbackGroundField,
          size: 15.0,
        ),
        SizedBox(width: 10.0),
        Icon(
          Icons.circle,
          color:
              cubit_select.selectedIndex == 2
                  ? AppColors.kPrimaryColor
                  : AppColors.kbackGroundField,
          size: 15.0,
        ),
      ],
    );
  }
}
