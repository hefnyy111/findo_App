// features/auth/presentation/get_Started/views/widgets/custom_drop_down_button.dart

import 'package:Ascend/features/auth/presentation/get_Started/language/manager/language_cubit.dart';
import 'package:Ascend/features/auth/presentation/get_Started/language/manager/language_states.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLanguageDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LanguageCubit, LanguageStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit_lang = LanguageCubit.get(context);
        return Center(
          child: Container(
            height: 50.0,
            width: 140.0,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: AppColors.kbackGroundField,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: AppColors.kPrimaryColor.withOpacity(0.5),
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                value: cubit_lang.selectedLanguage,
                hint: Row(
                  children: [
                    Icon(
                      Icons.language_outlined,
                      color: AppColors.kPrimaryColor,
                      size: 20.0,
                    ),
                    const SizedBox(width: 5.0),
                    const Text(
                      "Language",
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ],
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(Icons.arrow_drop_down, color: Colors.cyanAccent),
                ),
                // ******************************* Button style
                buttonStyleData: ButtonStyleData(
                  height: 55,
                  width: 140,
                  decoration: BoxDecoration(
                    color: AppColors.kbackGroundField,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                // ******************************* menu style
                dropdownStyleData: DropdownStyleData(
                  useSafeArea: true,
                  width: 140,
                  openInterval: const Interval(0.25, 0.5),
                  maxHeight: 220,
                  padding: EdgeInsets.zero,
                  elevation: 4,
                  decoration: BoxDecoration(
                    color: AppColors.kbackGroundField,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColors.kPrimaryColor.withOpacity(0.5),
                    ),
                  ),
                  offset: cubit_lang.selectedLanguage == "Arabic" ?
                   const Offset(10, -7) : const Offset(-10, -7)
                ),

                // ******************************* item style
                menuItemStyleData: const MenuItemStyleData(
                  height: 45,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                ),
                items:
                    cubit_lang.language.map((category) {
                      return DropdownMenuItem<String>(
                        value: category["name"],
                        child: Row(
                          children: [
                            Text(
                              category['icon'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 5.0),

                            Text(
                              category['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                onChanged: (value) {
                  cubit_lang.changeLanguage(value);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
