// feature/auth/presentation/get_Started/get_started_view.dart
// faatures/authentocation/presentaition/get_Started/get_started_view.dart

import 'package:Ascend/feature/auth/presentation/get_Started/action/get_started_action.dart';
import 'package:Ascend/feature/auth/presentation/get_Started/language/cubit/language_cubit.dart';
import 'package:Ascend/feature/auth/presentation/get_Started/language/states/language_states.dart';
import 'package:Ascend/feature/auth/presentation/get_Started/views/widgets/custom_drop_down_button.dart';
import 'package:Ascend/shared/Components/components.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LanguageCubit, LanguageStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.kbackgroundColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                Image.asset('assets/logo_acsend.png', height: 150, width: 150),
                // ******************************* Sizebox
                const SizedBox(height: 50),
                // ******************************* Text 1
                const Text(
                  'Hello to Acsend',
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
                const Text(
                  'Your journey to smarter chat & epic rewards begins',
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
                    function:
                        () => GetStartedAction.getStartedButtonPress(
                          context,
                          "go_getStarted",
                        ),
                    text: 'Start your journey',
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
          // ******************************* Button Navigate
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ///- TEXT
                const Text(
                  'By tapping "Start your journey", you agree to',
                  style: TextStyle(color: AppColors.kGreyColor, fontSize: 12.0),
                ),

                ///- SIZEBOX
                const SizedBox(height: 4),

                ///- ROW
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ///- OUR
                    const Text(
                      ' our ',
                      style: TextStyle(
                        color: AppColors.kGreyColor,
                        fontSize: 12.0,
                      ),
                    ),

                    ///- TEXT BUTTON 1
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(0.0),
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Privacy Policy',

                        style: TextStyle(
                          color: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          fontSize: 12.0,
                        ),
                      ),
                    ),

                    ///- AND
                    const Text(
                      ' and ',
                      style: TextStyle(
                        color: AppColors.kGreyColor,
                        fontSize: 12.0,
                      ),
                    ),

                    ///- TEXT BUTTON 2
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(0.0),
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Terms of Service.',

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
