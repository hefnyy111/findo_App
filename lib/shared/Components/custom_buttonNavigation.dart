
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomButtomNavigationBar extends StatelessWidget {
  const CustomButtomNavigationBar({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });
  
  final String text1, text2;
  final void Function()? onTap;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [    
          Text(
            text1,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.ksubTitle,
            ),
          ),
          SizedBox(width: 4),
          GestureDetector(
            onTap: onTap,
            child: Text(
              text2,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.kPrimaryColor,
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
