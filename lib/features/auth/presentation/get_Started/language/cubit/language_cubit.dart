// feature/auth/presentation/get_Started/language/cubit/language_cubit.dart

import 'package:Ascend/features/auth/presentation/get_Started/language/states/language_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<LanguageStates> {
  LanguageCubit() : super(LanguageInitialStates()) {
    print("LanguageCubit created ✅");
  }

  static LanguageCubit get(context) => BlocProvider.of(context);

  String? selectedLanguage;

  final List<Map<String, dynamic>> language = [
    {"name": "Arabic", "icon": "🇪🇬"},
    {"name": "English", "icon": "🇬🇧"},
  ];

  void changeLanguage(String? value) {
    selectedLanguage = value;
    print('Selected: $value');
    emit(LanguageChangedStates());

    if (selectedLanguage == "Arabic") {
      print('ar - اللغة العربية مختارة');
    } else {
      print('en - اللغة الإنجليزية مختارة');
    }
  }
}
