// features/auth/presentation/sign_in/manager/sign_in_cubit.dart
import 'package:Ascend/features/auth/presentation/sign_in/manager/sign_in_states.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:Ascend/shared/network/cashe_helper.dart';
import 'package:Ascend/shared/network/dio_helper.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(SignInInitialStates());

  static SignInCubit get(context) => BlocProvider.of(context);

  // ******************************* Inputs
  final phoneNumber = TextEditingController();
  var codeCounter = TextEditingController(text: "+");
  final email = TextEditingController();
  final forkey_signin = GlobalKey<FormState>();
  final searchController = TextEditingController();

  // ******************************* Select Email OR Phone
  bool isPhoneSelected = true;
  Color colorBackground = AppColors.kPrimaryColor;
  Color textColor = Colors.white;
  void toggleSelected(bool selectPhone, context) {
    isPhoneSelected = selectPhone;
    if (isPhoneSelected) {
      colorBackground = AppColors.kPrimaryColor;
      textColor = Colors.white;
    } else {
      colorBackground = Colors.white;
      textColor = AppColors.kPrimaryColor;
    }
    emit(SignInSelectButtonStates());
    changeButton(null, context);
  }

  // ******************************* select country
  String selectCountry = "Select country";
  Color colorCountry = AppColors.kGreyColor;
  Color colorCodeCountry = AppColors.kGreyColor;
  String selectCodeCountry = "";
  String selectCountryISO = "";

  void selectedCountryy(Country country) {
    selectCountry = "${country.name}";
    selectCountryISO = country.countryCode;
    colorCountry = Colors.white;
    colorCodeCountry = Colors.white;
    selectCodeCountry = "+${country.phoneCode}";
    codeCounter = TextEditingController(text: selectCodeCountry);

    emit(SignInSelectCountryStates());
  }

  // ******************************* Change button
  Color background_button = AppColors.kbutton_disabel;
  Color text_button = Colors.grey;
  Color borderSide = AppColors.kbutton_disabel;
  VoidCallback? button_onpressed;
  bool ButtonShimmer = false;
  bool info_phone = false;

  Future<void> changeButton(
    String? valuee,
    context, {
    VoidCallback? customButtonAction,
  }) async {
    bool info_email = email.text.isNotEmpty;
    bool info_phone =
        selectCountry != "Select country" &&
        codeCounter.text.trim().isNotEmpty &&
        phoneNumber.text.trim().isNotEmpty;

    if (isPhoneSelected) {
      if (info_phone) {
        background_button = AppColors.kPrimaryColor;
        text_button = Colors.white;
        ButtonShimmer = true;
        borderSide = AppColors.kPrimaryColor;
        button_onpressed = customButtonAction;
      } else {
        ButtonShimmer = false;
        background_button = AppColors.kbutton_disabel;
        text_button = Colors.grey;
        borderSide = AppColors.kbutton_disabel;
        button_onpressed = null;
      }
    } else {
      // email
      if (info_email) {
        background_button = AppColors.kPrimaryColor;
        text_button = Colors.white;
        ButtonShimmer = true;
        borderSide = AppColors.kPrimaryColor;
        button_onpressed = customButtonAction;
      } else {
        ButtonShimmer = false;
        background_button = AppColors.kbutton_disabel;
        text_button = Colors.grey;
        borderSide = AppColors.kbutton_disabel;
        button_onpressed = null;
      }
    }

    emit(SigninChangeButtonStates());
  }

  // ******************************* Search
  bool showSearch = false;
  void showSearchNow(bool value) {
    showSearch = value;
    emit(SignInShowSearchStates());
  }

  String searchQuery = "";
  void updateSearchQuery(String? value) {
    searchQuery = value!;
    emit(SignInUpdateSearchStates());
  }

  void clearSearch() {
    searchController.clear();
    searchQuery = "";
    emit(SignInUpdateSearchStates());
  }

  // ******************************* Email API
  void sendEmail({required String email}) async {
    emit(SigninLoadingEmailStates());

    try {
      final response = await DioHelper.postData(
        url: "login_email",
        data: {"email": email},
      );

      final login_model = response.data['next_step'];
      if (login_model == "verify_login") {
        print('Done login to homeview');
      } else if (login_model == "verify_register") {
        print('Done login and register now');
      }
      emit(SigninSuccessEmailStates());
    } catch (e) {
      emit(SigninErrorEmailStates(e.toString()));
    }
  }

  // ******************************* Phone API + Notification
  String deviceToken = "";
void sendPhone({required String phone}) async {
    emit(SigninLoadingPhoneOTPStates());
    
     deviceToken = await FirebaseMessaging.instance.getToken() ?? "";
     print(deviceToken);
    try {
      final response = await DioHelper.postData(
        url: "login_phone",
        data: {
          "phone": phone,
          "deviceToken": deviceToken
          },
      );
      print(response.data);

      emit(SigninSuccessPhoneOTPStates());
    } catch (e) {
      emit(SigninErrorPhoneOTPtates(e.toString()));
    }
  }

}
