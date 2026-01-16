// features/auth/presentation/get_Started/get_started_view.dart
import 'package:Ascend/features/auth/presentation/get_Started/action/get_started_action.dart';
import 'package:Ascend/features/auth/presentation/get_Started/language/manager/language_cubit.dart';
import 'package:Ascend/features/auth/presentation/get_Started/language/manager/language_states.dart';
import 'package:Ascend/generated/l10n.dart';
import 'package:Ascend/shared/Components/components.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'views/widgets/custom_drop_down_button.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LanguageCubit, LanguageStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit_lang = LanguageCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.kbackgroundColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: cubit_lang.forKeySelecetedLanguage,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50.0),
                  // ******************************* Language
                  CustomLanguageDropdown(),
                  // ******************************* Sizebox
                  SizedBox(height: 80.0),
                  // ******************************* Image
                  Image.asset('assets/Images/logo_acsend.png', height: 150, width: 150),
                  // ******************************* Sizebox
                  const SizedBox(height: 50),
                  // ******************************* Text 1
                  Text(
                    S.of(context).getstarted_title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'SF-Pro-Rounded-Bold',
                      color: Colors.white,
                      fontSize: 32,
              
                      height: 1.4,
                    ),
                  ),
                  // ******************************* Sizebox
                  const SizedBox(height: 20),
                  // ******************************* Text 2
                  Text(
                    S.of(context).getstarted_subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.kGreyColor,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                  // ******************************* Sizebox
                  const SizedBox(height: 60),
                  // ******************************* Button 1
                  SizedBox(
                    width: double.infinity,
                    child: customButton(
                      function:() => GetStartedAction.getStartedButtonPress(  context,  "go_getStarted",),
                      text: S.of(context).getstarted_textbutton,
                      colorBorderside: AppColors.kPrimaryColor,
                      colorText: Colors.white,
                      width: double.infinity,
                      backColor: AppColors.kPrimaryColor,
                    ),
                  ),
                  // ******************************* Sizebox
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          
          // ******************************* Button Navigate
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 16.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ******************************* TEXT
                Text(
                  S.of(context).getstarted_button_navigation_text1,
                  style: TextStyle(color: AppColors.kGreyColor, fontSize: 12.0),
                ),
                // ******************************* SIZEBOX
                const SizedBox(height: 4),
                // ******************************* ROW
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ******************************* OUR
                    Text(
                         S.of(context).getstarted_button_navigation_text2,
                      style: TextStyle(
                        color: AppColors.kGreyColor,
                        fontSize: 12.0,
                      ),
                    ),
                    // ******************************* Sizebox
                    SizedBox(width: 5.0,),
                    // ******************************* TEXT BUTTON 1
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(0.0),
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                           S.of(context).getstarted_button_navigation_button1,
                        style: TextStyle(
                          color: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    // ******************************* Sizebox
                    SizedBox(width: 3.0,),
                    // ******************************* AND
                    Text(
                         S.of(context).getstarted_button_navigation_text3,
                      style: TextStyle(
                        color: AppColors.kGreyColor,
                        fontSize: 12.0,
                      ),
                    ),
                    // ******************************* Sizebox
                    SizedBox(width: 5.0,),
                    // ******************************* TEXT BUTTON 2
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(0.0),
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                           S.of(context).getstarted_button_navigation_button2,
                        style: TextStyle(
                          color: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
