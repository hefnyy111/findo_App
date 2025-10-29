// features/auth/presentation/get_Started/language/manager/language_cubit.dart

import 'package:Ascend/features/auth/presentation/get_Started/language/manager/language_states.dart';
import 'package:Ascend/shared/network/cashe_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<LanguageStates> {
  LanguageCubit() : super(LanguageInitialStates());

  static LanguageCubit get(context) => BlocProvider.of(context);
  final forKeySelecetedLanguage = GlobalKey<FormState>();
  String? selectedLanguage;

  final List<Map<String, dynamic>> language = [
    {"name": "Arabic", "icon": "🇪🇬"},
    {"name": "English", "icon": "🇬🇧"},
  ];

  void changeLanguage(String? value) {
    selectedLanguage = value;
    print('Selected: $value');
    emit(LanguageChangedStates());
      CasheHelper.saveData(key: 'language', value: selectedLanguage,);
    if (selectedLanguage == "Arabic") {
      print('ar - اللغة العربية مختارة');
      
    } else {
      print('en - اللغة الإنجليزية مختارة');
    }
  }

  void loadSavedLanguage() {
  selectedLanguage = CasheHelper.getData(key: 'language') ?? "English";
  emit(LanguageChangedStates());
}
}
