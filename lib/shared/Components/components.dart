// shared/Components/components.dart

import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ====================== Navigator and finish ======================
void navigatorAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (Route<dynamic> route) => false,
  );
}

// ====================== Icon back ======================
Widget customIcon({required VoidCallback funtions}) {
  return IconButton(
    onPressed: funtions,
    icon: Icon(Icons.close, color: Colors.white, size: 25),
  );
}

// ====================== Button field ======================
Widget customButton({
  required VoidCallback? function,
  required String text,
  required Color? colorBorderside,
  Color? backColor,
  String? image,
  required Color? colorText,
  required double? width,

  double? fontsize,
  double? paddingVertical,

  bool? enablee,
}) => SizedBox(
  width: width,
  height: 50,
  child: OutlinedButton(
    onPressed: function,
    style: OutlinedButton.styleFrom(
      backgroundColor: backColor,
      side: BorderSide(color: colorBorderside!, width: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      padding:
          paddingVertical != null
              ? EdgeInsets.symmetric(vertical: paddingVertical)
              : EdgeInsets.symmetric(vertical: 14),
    ),

    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (image != null) ...[
          ClipRRect(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: 30.0,
              height: 30.0,
            ),
          ),
          SizedBox(width: 10.0),
        ],
        Text(
          text,
          style: TextStyle(
            color: colorText,
            fontSize: fontsize != null ? fontsize : 18.0,
          ),
        ),
      ],
    ),
  ),
);

// ====================== Form field ======================
Widget customTextFormField({
  required TextEditingController controller,
  required String? Function(String?) validate,
  bool readOnly = false,
  TextInputType? keyboard,
  bool obscureText = false,
  required Function(String?) onChanged,
  FocusNode? focusNode,
  List<TextInputFormatter>? inputFormatters,
  int? minLines,
  int? maxLines,
  int? length,
  required String text,
  Widget? prefixIcon,
  Widget? suffixIcon,
  VoidCallback? onSuffixPressed,
}) {
  return TextFormField(
    minLines: minLines,
    maxLines: obscureText ? 1 : maxLines,
    obscureText: obscureText,
    controller: controller,
    validator: validate,
    readOnly: readOnly,
    onChanged: onChanged,
    style: TextStyle(color: Colors.white, fontSize: 12),
    cursorColor: Colors.white,
    focusNode: focusNode,
    inputFormatters: inputFormatters,
    maxLength: length, // length
    decoration: InputDecoration(
      filled: true,
      fillColor: const Color(0xFF1E1F23),
      hintText: text,
      hintStyle: TextStyle(color: Color(0xFF9E9E9E), fontSize: 12.0),
      prefixIcon: prefixIcon,
      suffixIcon:
          suffixIcon != null
              ? IconButton(onPressed: onSuffixPressed, icon: suffixIcon)
              : null,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.kPrimaryColor),
      ),
    ),
  );
}

// ====================== Message notes ======================
void customSnackBarMessage(
  BuildContext context, {
  required String text,
  required Color color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      backgroundColor: color,
    ),
  );
}
