// features/auth/presentation/sign_in/action/sign_in_action.dart
import 'package:Ascend/features/auth/presentation/sign_in/manager/sign_in_cubit.dart';
import 'package:Ascend/features/auth/presentation/sign_in/phone/widgets/sign_in_countries_view.dart';
import 'package:Ascend/shared/Components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
class SignInAction {
  static void signInButtonPress(context, String? action) async {
    var cubit_signin = SignInCubit.get(context);
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    
    switch (action) {
      // ******************************* Button Login
      case "continue_login":
        {
        // **************** Phone ***************
      if (cubit_signin.isPhoneSelected) {
        bool isValid = false;
        String pattern = "";

        switch (cubit_signin.selectCountryISO.toUpperCase()) {
          case 'EG': // مصر 🇪🇬
            pattern = r'^(0?)(10|11|12|15)[0-9]{8}$';
            break;

          case 'SA': // السعودية 🇸🇦
            pattern = r'^(5)[0-9]{8}$';
            break;

          case 'AE': // الإمارات 🇦🇪
            pattern = r'^(5)[0-9]{8}$';
            break;

          case 'US': // أمريكا 🇺🇸
            pattern = r'^[2-9][0-9]{9}$';
            break;

          default:
            pattern = r'^[0-9]{7,15}$';
            break;
        }

        final reg = RegExp(pattern); // Regular Expression
        isValid = reg.hasMatch(cubit_signin.phoneNumber.text.trim());

        if (!isValid) {
          showMessage(context,
          text1: 'The number you entered does not match that country: ${cubit_signin.selectCountry}',
          text_button1: 'OK',
          color_buttonSide1: Color.fromARGB(255, 24, 24, 26),
          textColor_button1: AppColors.kPrimaryColor,
          color_buttonBackground1: Color.fromARGB(255, 24, 24, 26),
          width1: 100.0,
          alignment1: Alignment.bottomRight,
          onpressed_button1: () {
            Navigator.pop(context);
          },
          );
          return;
        }

        String fullPhone = "${cubit_signin.selectCodeCountry}${cubit_signin.phoneNumber.text.trim()}";

        print('📲 Logging in with phone: $fullPhone');


        // **************** Email ****************
      } else {
        if (!emailRegExp.hasMatch(cubit_signin.email.text.trim())) {
          customSnackBarMessage(
            context,
            text: 'The email you entered is incorrect. Please try again.',
            color: Colors.white,
          );
        } else if (cubit_signin.forkey_signin.currentState!.validate()) {
          print('✅ Done login with email: ${cubit_signin.email.text.trim()}');
        }

      }
        }
        
      break;

      // ******************************* back to sign in
      case 'back_signin':
        {
          Navigator.pop(context);
        }
        break;
      // ******************************* Go countries screen
      case 'go_countries':
        {
          print('test');
          final country = await Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => BlocProvider.value(
                    value: SignInCubit.get(context),
                    child: SignInCountriesView(),
                  ),
            ),
          );
          if (country != null) {
            cubit_signin.selectedCountryy(country);
          }
        }
        break;
      // ******************************* Show search
      case 'show_search':
        {
          print('tsadsaest');
          cubit_signin.showSearchNow(true);
        }
        break;
      // ******************************* Hide search
      case 'hide_search':
        {
          print('tsadsaest');
          cubit_signin.showSearchNow(false);
        }
        break;
    }
  }
}
