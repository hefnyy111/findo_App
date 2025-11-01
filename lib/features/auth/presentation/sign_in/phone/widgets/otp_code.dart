import 'package:Ascend/shared/core/utlis/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpCode extends StatefulWidget {
  const OtpCode({super.key});

  @override
  State<OtpCode> createState() => _OtpCodeState();
}

class _OtpCodeState extends State<OtpCode> {
  final firstFocus = FocusNode();
  final secondFocus = FocusNode();
  final firstController = TextEditingController();
  final secondController = TextEditingController();

  List<String> firstDigits = ["0", "0", "0"];
  List<String> secondDigits = ["0", "0", "0"];

  @override
  void dispose() {
    firstFocus.dispose();
    secondFocus.dispose();
    firstController.dispose();
    secondController.dispose();
    super.dispose();
  }

  void updateDigits(String input, List<String> digits, FocusNode nextFocus) {
    for (int i = 0; i < 3; i++) {
      if (i < input.length) {
        digits[i] = input[i];
      } else {
        digits[i] = "0";
      }
    }

    if (input.length == 3) {
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }

  Widget buildBox({
    required List<String> digits,
    required TextEditingController controller,
    required FocusNode focusNode,
    required FocusNode nextFocus,
  }) {
    return Container(
      width: 90,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: focusNode.hasFocus ? AppColors.kPrimaryColor : Colors.grey,
          width: focusNode.hasFocus ? 2 : 1,
        ),
        boxShadow: [
          if (focusNode.hasFocus)
            BoxShadow(
              color: AppColors.kPrimaryColor.withOpacity(0.15),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (i) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder:
                    (child, anim) => SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 1),
                        end: Offset.zero,
                      ).animate(anim),
                      child: child,
                    ),
                child: Text(
                  digits[i],
                  key: ValueKey(digits[i] + i.toString()),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              );
            }),
          ),
          Opacity(
            opacity: 0,
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(3)],
              autofocus: focusNode == firstFocus,
              onChanged: (val) {
                setState(() {
                  updateDigits(val, digits, nextFocus);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildBox(
            digits: firstDigits,
            controller: firstController,
            focusNode: firstFocus,
            nextFocus: secondFocus,
          ),
          buildBox(
            digits: secondDigits,
            controller: secondController,
            focusNode: secondFocus,
            nextFocus: FocusNode(),
          ),
        ],
      ),
    );
  }
}
