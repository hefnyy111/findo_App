// features/auth/presentation/Sign_up/step_account_4/step_account4_view.dart
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_4/action/step_account4_action.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_4/manager/step_account4_cubit.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_4/manager/step_account4_states.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/widgets/step_progress.dart';
import 'package:Ascend/shared/Components/components.dart';
import 'package:Ascend/shared/core/constants/app_router.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class StepAccount4View extends StatelessWidget {
  final String full_name;
  final String username;
  final String password;
  final String photo_url;
  
  StepAccount4View({required this.full_name, required this.username, required this.password, required this.photo_url});
  
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StepAccount4Cubit(),
      child: BlocConsumer<StepAccount4Cubit, StepAccount4States>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit_step4 = StepAccount4Cubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset: true,
            extendBodyBehindAppBar: true,
            backgroundColor: AppColors.kbackgroundColor,
            appBar: AppBar(
              backgroundColor: AppColors.kbackgroundColor,
              leading: customIconback(
                funtions: () {
                  GoRouter.of(context).go(AppRouter.kGetStartedView);
                },
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(20.0),

              child: Form(
                key: cubit_step4.forkey_step1,
                child: SingleChildScrollView(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // ******************************* Step Progress
                        StepProgress(currentStep: 4, totalSteps: 4),
                        // ******************************* Sizebox
                        SizedBox(height: 45.0),
                        // ******************************* Secure your account
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'About your account',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              height: 1.4,
                            ),
                          ),
                        ),
                        // ******************************* Sizebox
                        SizedBox(height: 10.0),
                        // *******************************
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Tell us more about what makes you unique',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppColors.kGreyColor,
                              fontSize: 13,
                              height: 1.3,
                            ),
                          ),
                        ),
                        // ******************************* Sizebox
                        SizedBox(height: 60.0),
                        // ******************************* Bio
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            color: AppColors.kbackGroundField,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.kPrimaryColor,
                                offset: Offset(0, 2),
                                blurRadius: 4,
                              )
                            ],
                          ),
                          
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ************** Description
                                Text('About me',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                ),
                                SizedBox(height: 10.0,),
                                // ************** Field
                                Expanded(
                                  child: TextField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 8,
                                    maxLength: 500,
                                    controller: cubit_step4.bio,
                                    cursorColor: AppColors.kPrimaryColor,
                                    style: TextStyle(color: Colors.white, fontSize: 12),
                                    onChanged: (value) {
                                      cubit_step4.changeButton(value, onClickButton: () => StepAccount4Action.StepAccount_4Action(full_name,username,password,photo_url, context, value, "finish")
                                      );
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Write something about yourself here',
                                      hintStyle: TextStyle(color: Colors.grey[500], fontSize: 12),
                                      counterText: "${cubit_step4.bio.text.length}/500 characters",
                                      counterStyle: TextStyle(color: AppColors.kGreyColor),
                                      filled: true,
                                      fillColor: AppColors.kbackgroundColor,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide.none
                                      ),
                                      contentPadding: EdgeInsets.all(10)
                                    ),
                                  ),
                                ),
                    
                              ],
                            ),
                          ),
                        ),
                    
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // ******************************* Button Next
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(24),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(25),
                child: Shimmer(
                  duration: Duration(seconds: 4),
                  interval: Duration(seconds: 1),
                  color: Colors.grey,
                  colorOpacity: 1,
                  enabled: cubit_step4.shimmer_button,
                  direction: ShimmerDirection.fromLBRT(),
                  child: customButton(
                    function: cubit_step4.onpressed_button,
                    text: "Finish",
                    colorBorderside: cubit_step4.backGround_button,
                    backColor: cubit_step4.borderSide_button,
                    colorText: cubit_step4.text_button,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
