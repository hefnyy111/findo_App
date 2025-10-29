import 'package:Ascend/shared/core/utlis/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpCode extends StatefulWidget {
  const OtpCode({super.key});

  @override
  State<OtpCode> createState() => _OtpCodeState();
}

class _OtpCodeState extends State<OtpCode> {
  final firstController = TextEditingController();
  final secondController = TextEditingController();

  bool isFirstActive = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildCodeBox(
            controller: firstController,
            isActive: isFirstActive,
            onTap: () {
              setState(() => isFirstActive = true);
            },
          ),
          const SizedBox(width: 10),
          buildCodeBox(
            controller: secondController,
            isActive: !isFirstActive,
            onTap: () {
              setState(() => isFirstActive = false);
            },
          ),
        ],
      ),
    );
  }

  Widget buildCodeBox({
    required TextEditingController controller,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 249, 230, 230),
          borderRadius: BorderRadius.circular(20),
          border:
              isActive
                  ? Border.all(color: AppColors.kPrimaryColor, width: 1)
                  : null,
        ),
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [LengthLimitingTextInputFormatter(3)],
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: '',
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
