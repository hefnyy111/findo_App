import 'package:Ascend/shared/core/utlis/constants.dart';
import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });
  final String text1, text2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(fontSize: 14, color: AppColors.kGreyColor),
        ),
        SizedBox(width: 6),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text2,
            style: TextStyle(fontSize: 14, color: AppColors.kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
