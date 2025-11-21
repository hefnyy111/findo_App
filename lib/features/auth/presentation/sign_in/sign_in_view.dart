// features/auth/presentation/sign_in/sign_in_view.dart
import 'package:Ascend/features/auth/presentation/get_Started/action/get_started_action.dart';
import 'package:Ascend/features/auth/presentation/sign_in/action/sign_in_action.dart';
import 'package:Ascend/features/auth/presentation/sign_in/manager/sign_in_cubit.dart';
import 'package:Ascend/features/auth/presentation/sign_in/manager/sign_in_states.dart';
import 'package:Ascend/features/auth/presentation/sign_in/views/phone_counties_view/widgets/sign_in_fieldPicker.dart';
import 'package:Ascend/features/auth/presentation/sign_in/views/phone_counties_view/widgets/sign_in_select.dart';
import 'package:Ascend/shared/Components/components.dart';
import 'package:Ascend/shared/core/constants/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:Ascend/shared/core/constants/constants.dart';

class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInStates>(
      listener: (context, state) { 
        if(state is SigninSuccessEmailStates) {
          GoRouter.of(context).push(AppRouter.kVerifyCode);
        } else if(state is SigninErrorEmailStates) {
          customSnackBarMessage(
            context,
            text: "An error occurred. Please try again.",
            color: Colors.white
          );
        }

      },

      builder: (context, state) {
        var cubit_signin = SignInCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: true,
          extendBodyBehindAppBar: true,
          backgroundColor: AppColors.kbackgroundColor,
          body: Padding(
            padding: EdgeInsetsGeometry.all(24.0),
            child: Form(
              key: cubit_signin.forkey_signin,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ******************************* Sizebox
                    const SizedBox(height: 100.0),
                    // ******************************* Text 1
                    Center(
                      child: Column(
                        children: [
                          Text(
                           cubit_signin.isPhoneSelected ? 'Enter your phone number' : 'Enter your email' ,
                            style: TextStyle(
                              fontFamily: 'SF-Pro-Rounded-Bold',
                              color: Colors.white,
                              fontSize: 26,
                              height: 1.4,
                            ),
                          ),
                          // ******************************* Sizebox
                          const SizedBox(height: 20.0),
                          // ******************************* Text 2
                          Text(
                           cubit_signin.isPhoneSelected ? "Verification is quick and easy -- just\n enter your number below" : "Verification is quick and easy -- just\n enter your email below",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.kGreyColor,
                              fontSize: 15,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ******************************* Sizebox
                    const SizedBox(height: 50.0),
                    // ******************************* Select
                    SignInSelect(),
                    // ******************************* Sizebox
                    const SizedBox(height: 50.0),
                    // ******************************* Condition  *******************************
                    //
                    //
                    if(cubit_signin.isPhoneSelected) ...[
                    // ******************************* Country
                    SignInPicker(),
                    // ******************************* Sizebox
                    const SizedBox(height: 20.0),
                    // ******************************* Field phone
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 70,
                          child: customTextField(
                            controller: cubit_signin.codeCounter,
                            onChanged: (valuee) {
                              cubit_signin.changeButton(valuee, context, customButtonAction: () =>  SignInAction.signInButtonPress(  context,  "continue_login",),);
                            },
                            text: "",
                          ),
                        ),
                
                        SizedBox(width: 8.0),
                
                        Expanded(
                          child: customTextFormField(
                            controller: cubit_signin.phoneNumber,
                            validate: (value) {},
                            onChanged: (valuee) {
                             cubit_signin.changeButton(valuee, context, customButtonAction: () =>  SignInAction.signInButtonPress(context,  "continue_login",),);
                
                            },
                            text: "Phone",
                          ),
                        ),
                      ],
                    ),
                    // ******************************* Sizebox
                    const SizedBox(height: 50.0),
                    ] else ...[
                
                    // ******************************* field email
                    customTextFormField(
                      controller: cubit_signin.email, 
                      validate: (value) {
                      }, 
                      onChanged: (valuee) {
                      cubit_signin.changeButton(valuee, context, customButtonAction: () =>  SignInAction.signInButtonPress(context,  "continue_login",),);
                      } , 
                      text: "Email"
                      ),
                    // ******************************* Sizebox
                    const SizedBox(height: 25.0),
                    // ******************************* forgeted password
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                         onPressed:() => GetStartedAction.getStartedButtonPress(  context,  "forgeted_password",),
                         style: TextButton.styleFrom(
                          padding: EdgeInsets.all(0),
                          minimumSize: Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap
                         ),
                         child: Text(
                           'Forgeted password?',
                           style: TextStyle(
                             color: AppColors.kPrimaryColor,
                             fontSize: 13.0,
                           ),
                         ),
                          ),
                    ),
                    // ******************************* Sizebox
                    const SizedBox(height: 30.0),
                    ],
                    
                  ],
                ),
              ),
            ),
          ),
      // ******************************* Button contiue
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(24),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(25),
              child: Shimmer(
                duration: Duration(seconds: 4),
                        interval: Duration(seconds: 1),
                        color: Colors.grey,
                        colorOpacity: 1,
                        enabled: cubit_signin.ButtonShimmer,
                        direction: ShimmerDirection.fromLBRT(),
                child: customButton(
                        function: cubit_signin.button_onpressed,
                        text: "Continue",
                        colorBorderside: cubit_signin.borderSide,
                        backColor: cubit_signin.background_button,
                        colorText: cubit_signin.text_button,
                        width: double.infinity,
                      ),
              ),
            ),
            ),
        );
      },
    );
  }
}
