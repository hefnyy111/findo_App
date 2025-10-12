
import 'package:findo/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomButtonBorder extends StatelessWidget {
  const CustomButtonBorder({
    super.key,
    required this.title,
    this.onTap,
    this.borderRadius,
    this.verticalPadding,
  });
  final String title;
  final double? verticalPadding;
  @override
  final double? borderRadius;
  final void Function()? onTap;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 15),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 12),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
