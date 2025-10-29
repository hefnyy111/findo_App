// features/auth/presentation/sign_in/action/sign_in_action.dart
import 'package:Ascend/features/auth/presentation/sign_in/manager/sign_in_cubit.dart';
import 'package:Ascend/features/auth/presentation/sign_in/phone/widgets/sign_in_countries_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInAction {
  static void signInButtonPress(context, String? action) async {
    var cubit_signin = SignInCubit.get(context);
    switch (action) {
      // ******************************* Button Login
      case "continue_login":
        {}
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
