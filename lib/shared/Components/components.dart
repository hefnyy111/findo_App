// shared/Components/components.dart
import 'package:findo/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

 // ====================== Navigator and finish ======================
 void NavigatorAndFinist(context , Widget) {
  Navigator.pushAndRemoveUntil(
    context, 
    MaterialPageRoute(builder: (context) => Widget),
    (Route<dynamic> route) => false,
  );
 }

 // ====================== Icon back ======================
 Widget defauilIcon({required VoidCallback funtions}) { 
  return IconButton(
  onPressed: funtions,
  icon: Icon(
    Icons.close, 
    color: Colors.white, 
    size: 25
  ),
);
}
 
 // ====================== Button field ======================
 Widget defauilButton({
  required VoidCallback? Functionn,
  required String text,
  required Color? color_borderside,
  Color? backgroundColor,
  String? image,
  required Color? colorText,
  required double? width,
  double? height,
  double? Fontsize,
  double? padding_vertical,

  bool? enablee,
}) => SizedBox(
  width: width,
  height: height,
  child: OutlinedButton(
    onPressed: Functionn,
    style: OutlinedButton.styleFrom(
      backgroundColor: backgroundColor,
      side: BorderSide(color: color_borderside!, width: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      padding: padding_vertical != null ? EdgeInsets.symmetric(vertical: padding_vertical) : EdgeInsets.symmetric(vertical: 14),
    ),

    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (image != null) ...[
          ClipRRect(
          child: Image.asset(image, fit: BoxFit.cover, width: 30.0, height: 30.0)),
          SizedBox(width: 10.0),
        ],
        Text(
          text,
          style: TextStyle(
            color: colorText,
            fontSize: Fontsize != null ? Fontsize : 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
);

 // ====================== Form field ======================
 Widget defauilFieldd({
required TextEditingController controller,
required String? Function(String?) validate,
bool readOnly = false,
TextInputType? keyboard,
required Function(String?) onChanged,
FocusNode? focusNode,
List <TextInputFormatter>? inputFormatters,
int? length,
required String text,
Widget? prefixIcon,
Widget? suffixIcon,
VoidCallback? onSuffixPressed,
}) {
  return TextFormField(
   controller: controller,
   validator: validate,
   readOnly: readOnly,
   keyboardType: keyboard,
   onChanged: onChanged,
   style: TextStyle(
    color: Colors.white,
    fontSize: 16
   ),
   cursorColor: Colors.white,
   focusNode: focusNode,
   inputFormatters: inputFormatters,
   maxLength: length,
   decoration: InputDecoration(
    filled: true,
    fillColor: const Color(0xFF1E1F23),
    hintText: text,
    hintStyle: TextStyle(
      color: Color(0xFF9E9E9E),
      fontSize: 16.0,
    ),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon != null ? IconButton(onPressed: onSuffixPressed, icon: suffixIcon) : null,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.transparent)
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color_app), // اللون الأساسي
      ),
   ),
  );
}
 
 // ====================== Message notes ======================
 void defaultMessage(BuildContext context , {required String text, required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
      content: Text(text,
      style: TextStyle(
         color: Colors.black, fontWeight: FontWeight.bold,
      ),
      ),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
      backgroundColor: color,

      ),
  );
 }

 // ====================== Message Diaolg ======================
 void ShowDialogMessage(BuildContext context, {
  required String text1,
  required String text2,
  required VoidCallback? functionButton1,
  required String? textbutton1,
  required VoidCallback? functionButton2,
  required String? textbutton2,
 }) {
  showDialog(
    context: context, 
    barrierDismissible: false,
    builder: (context) => Dialog(
     backgroundColor: Colors.white,
     shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
     child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 300,
        ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // ========== Text ==========
            Text(
              text1 ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
            // ========== Sizebox ==========
            const SizedBox(height: 15),
            // ========== Text ==========
            Text(
              text2 ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 17.0
              ),
            ),
            // ========== Sizebox ==========
            const SizedBox(height: 25),
            // ========== Button 1 ==========
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color_app,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: functionButton1,
                child: Text(
                  textbutton1!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            // ========== Sizebox ==========
            const SizedBox(height: 10),
            // ========== Button 2 ==========
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.transparent),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: functionButton2,
                child: Text(
                  textbutton2!,
                  style: TextStyle(
                    color: Color_app,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

          ],
        ),
        ),

    ),
    ),
  );
 }