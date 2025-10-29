// features/auth/presentation/sign_in/manager/sign_in_cubit.dart
import 'package:Ascend/features/auth/presentation/sign_in/manager/sign_in_states.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:country_picker/country_picker.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(SignInInitialStates());

  static SignInCubit get(context) => BlocProvider.of(context);

  // ******************************* Variabels
  final phoneNumber = TextEditingController();
  var codeCounter = TextEditingController(text: "+");
  final email = TextEditingController();
  final forkey_signin = GlobalKey<FormState>();
  final searchController = TextEditingController();

  // ******************************* Select Email OR Phone
  bool isPhoeSelected = true;
  Color colorBackground = AppColors.kPrimaryColor;
  Color textColor = Colors.white;
  void toggleSelected(bool selectPhone) {
    isPhoeSelected = selectPhone;
    if (isPhoeSelected) {
      colorBackground = AppColors.kPrimaryColor;
      textColor = Colors.white;
      emit(SignInSelectButtonStates());
    } else {
      colorBackground = AppColors.kPrimaryColor;
      textColor = Colors.white;
      emit(SignInSelectButtonStates());
    }
  }

  // ******************************* select country
  String selectCountry = "Select country";
  Color colorCountry = AppColors.kGreyColor;
  Color colorCodeCountry = AppColors.kGreyColor;
  String selectCodeCountry = "";

  void selectedCountryy(Country country) {
    selectCountry = "${country.name}";
    colorCountry = Colors.white;
    colorCodeCountry = Colors.white;
    selectCodeCountry = "+${country.phoneCode}";
    codeCounter = TextEditingController(text: "+${country.phoneCode}");

    emit(SignInSelectCountryStates());
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

 // ******************************* Change button
 Color background_button = AppColors.kbutton_disabel;
 Color text_button = Colors.grey;
 Color borderSide = AppColors.kbutton_disabel;
 VoidCallback? button_onpressed;
 bool ButtonShimmer = false;

 void changeButton(String? valuee, context, {VoidCallback? customButtonAction}) {
  bool info = selectCountry != "Select country" && selectCodeCountry.isNotEmpty && valuee!.isNotEmpty;
  if(info) {
   ButtonShimmer = true;
   background_button = AppColors.kPrimaryColor;
   text_button = Colors.white;
   borderSide = AppColors.kPrimaryColor;
   button_onpressed = customButtonAction;
  } else {
   ButtonShimmer = false;
   background_button = AppColors.kbutton_disabel;
   text_button = Colors.grey;
   borderSide = AppColors.kbutton_disabel;
   button_onpressed = null;
  }

  emit(SigninChangeButtonStates());
 }

}