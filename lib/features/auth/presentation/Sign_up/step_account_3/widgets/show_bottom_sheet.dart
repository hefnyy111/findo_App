// features/auth/presentation/Sign_up/step_account_3/widgets/show_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

Future<dynamic> showModelBottomSheet(
  BuildContext context, {
  required void Function()? onPressed1,
  required void Function()? onPressed2,
}) {
  return showModalBottomSheet(
    backgroundColor: Color(0xff26272C),
    context: context,
    builder: (BuildContext context) {
      // var cubit_step3 = StepAccount3Cubit.get(context);
      return Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                'Chooes profile picture',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconprofile(
                  text: 'Take photo',
                  onPressed: onPressed1,
                  icon: Iconsax.camera_copy,
                ),
                SizedBox(width: 80),
                CustomIconprofile(
                  text: 'Chooes photo',
                  onPressed: onPressed2,
                  icon: Iconsax.gallery,
                ),
              ],
            ),

            SizedBox(height: 30),
          ],
        ),
      );
    },
  );
}

// ******************************* CustomIconprofile
class CustomIconprofile extends StatelessWidget {
  const CustomIconprofile({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
  });
  final String text;
  final void Function()? onPressed;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: const Color.fromARGB(255, 250, 247, 247),
            size: 35,
          ),
        ),
        SizedBox(height: 15),
        Text(text, style: TextStyle(fontSize: 14, color: Colors.white)),
      ],
    );
  }
}
