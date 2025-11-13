// shared/Components/components.dart

import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ====================== Navigator and finish =====================
void navigatorAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (Route<dynamic> route) => false,
  );
}

// ====================== Icon back ======================
Widget customIconback({required VoidCallback funtions}) {
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
      counterText: "", 
      label: Text(text, style: TextStyle(color: AppColors.kGreyColor),),
      labelStyle: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 14),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon != null ? IconButton(onPressed: onSuffixPressed, icon: suffixIcon) : null,

      // ===== البوردر الخطّي =====
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.kGreyColor, width: 0.8),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.kPrimaryColor, width: 1.5),
      ),
    ),
  );
}

// ====================== Text field ======================
Widget customTextField({
  required TextEditingController controller,
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
  return TextField(
    minLines: minLines,
    maxLines: obscureText ? 1 : maxLines,
    obscureText: obscureText,
    controller: controller,
    readOnly: readOnly,
    onChanged: onChanged,
    style: TextStyle(color: Colors.white, fontSize: 12),
    cursorColor: Colors.white,
    focusNode: focusNode,
    inputFormatters: inputFormatters,
    maxLength: length, // length
    decoration: InputDecoration(
      counterText: "", 
      label: Text(text, style: TextStyle(color: Colors.white),),
      labelStyle: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 13),
      prefixIcon: prefixIcon ,
      prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
      contentPadding: EdgeInsets.zero,
      suffixIcon: suffixIcon != null ? IconButton(onPressed: onSuffixPressed, icon: suffixIcon) : null,

      // ===== البوردر الخطّي =====
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.kGreyColor, width: 0.8),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.kPrimaryColor, width: 1.5),
      ),
    ),
  );
}

// ====================== Message SnackBar ======================
void customSnackBarMessage(
  BuildContext context, {
  required String text,
  required Color color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
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

// ====================== Message ======================

void showMessage(BuildContext context, {
String? text1,
String? text2,

String? text_button1,
Color? textColor_button1,
Color? color_buttonSide1,
Color? color_buttonBackground1,
VoidCallback? onpressed_button1,
AlignmentGeometry? alignment1,
double? width1,
double? text_buttonSize1,

String? text_button2,
Color? textColor_button2,
Color? color_buttonSide2,
Color? color_buttonBackground2,
VoidCallback? onpressed_button2,
AlignmentGeometry? alignment2,
double? width2,
double? text1_buttonSize2,
}) async {
  showDialog(
    context: context, 
    barrierDismissible: false,
    builder: (context) => Dialog(
     backgroundColor: Color.fromARGB(255, 24, 24, 26),
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
     child: Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ******************************* Text 1
          Text(
          text1 ?? "",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: AppColors.kGreyColor,
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            height: 1.7
          ),
          ),
          // ******************************* Text 2
          if(text1 != null) ...[
          const SizedBox(height: 15,),
          Text(
          text2 ?? "",
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 10.0,
          ),
          ),
          ],
          
          const SizedBox(height: 15),
          // ******************************* Button 1
          Align(
            alignment: alignment1 ?? Alignment.center,
            child: Container(
              width: width1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color_buttonBackground1 ?? AppColors.kPrimaryColor,
                  side: BorderSide(color: color_buttonSide1 ?? AppColors.kPrimaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: onpressed_button1,
                child: Text(
                  text_button1 ?? "",
                  style: TextStyle(
                    color: textColor_button1,
                    fontSize: text_buttonSize1 ?? 13.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          // ******************************* Button 2
          if(text_button2 != null) ...[
          const SizedBox(height: 10),
          Align(
            alignment: alignment2 ?? Alignment.center,
            child: Container(
             width: width1,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: color_buttonBackground2,
                  side: BorderSide(color: color_buttonSide2!),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: onpressed_button2,
                child: Text(
                  text_button2 ?? "",
                  style: TextStyle(
                    color: textColor_button2,
                    fontSize: text1_buttonSize2 ?? 13.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          
          ]

        ],
      ),
      ),
    ),
    );
  
}
