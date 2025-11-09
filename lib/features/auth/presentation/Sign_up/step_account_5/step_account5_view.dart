// features/auth/presentation/Sign_up/step_account_5/step_account5_view.dart
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_5/manager/step_account5_cubit.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_5/manager/step_account5_states.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/widgets/step_progress.dart';
import 'package:Ascend/shared/Components/components.dart';
import 'package:Ascend/shared/core/constants/app_router.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class StepAccount5View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StepAccount5Cubit(),
      child: BlocConsumer<StepAccount5Cubit, StepAccount5States>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit_step5 = StepAccount5Cubit.get(context);
          return Scaffold(
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
                key: cubit_step5.forkey_step1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // ******************************* Step Progress
                    StepProgress(currentStep: 5, totalSteps: 5),
                    // ******************************* Sizebox
                    SizedBox(height: 45.0),
                    // ******************************* Secure your account
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'About your account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
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
                    // ******************************* Avatar
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
                                cursorColor: AppColors.kPrimaryColor,
                                style: TextStyle(color: Colors.white, fontSize: 12),
                                onChanged: (value) {
                                  
                                },
                                decoration: InputDecoration(
                                  hintText: 'Write something about yourself here',
                                  hintStyle: TextStyle(color: Colors.grey[500], fontSize: 12),
                                  counterText: "${cubit_step5.bio.text.length}/500 characters",
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
                  enabled: true,
                  direction: ShimmerDirection.fromLBRT(),
                  child: customButton(
                    function: () {},
                    text: "Finish",
                    colorBorderside: AppColors.kPrimaryColor,
                    backColor: AppColors.kPrimaryColor,
                    colorText: Colors.white,
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
