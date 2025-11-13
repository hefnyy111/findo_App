// features/auth/presentation/Sign_up/steip_account_1/widgets/lower_case_romatter.dart
import 'package:flutter/services.dart';

class LowerCaseRomatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue
  ) {
    return newValue.copyWith(
     text: newValue.text.toLowerCase(),
     selection: newValue.selection
    );
  }
}