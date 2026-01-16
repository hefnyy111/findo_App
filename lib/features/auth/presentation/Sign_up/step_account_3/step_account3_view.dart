// features/auth/presentation/Sign_up/step_account_3/step_account3_view.dart

import 'dart:io';

import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/action/step_account3_action.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/manager/step_account3_cubit.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/manager/step_account3_states.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/widgets/DashedBorderPainter.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/widgets/show_bottom_sheet.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/widgets/upload_photo.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/widgets/step_progress.dart';
import 'package:Ascend/shared/Components/components.dart';
import 'package:Ascend/shared/core/constants/app_router.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class StepAccount3View extends StatelessWidget {
  final String full_name;
  final String username;
  final String? password;
  StepAccount3View({ required this.full_name, required this.username, required this.password});

  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StepAccount3Cubit(),
      child: BlocConsumer<StepAccount3Cubit, StepAccount3States>(
        listener: (context, state) {
          if(state is ProfileImageSelected) {
            Navigator.pop(context);
          }
        },

        builder: (context, state) {
          var cubit_step3 = StepAccount3Cubit.get(context);
          return Scaffold(
            backgroundColor: AppColors.kbackgroundColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.kbackgroundColor,
              leading: customIconback(
                funtions: () => StepAccount3Action.StepAccount_3Action(full_name, username, password, context, "back_step2"),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(20.0),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // ******************************* Step Progress
                    StepProgress(currentStep: 3, totalSteps: 4),
                    // ******************************* Sizebox
                    SizedBox(height: 45.0),
                    // ******************************* Secure your account
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Compelete your profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          height: 1.4,
                        ),
                      ),
                    ),
                    // ******************************* Sizebox
                    SizedBox(height: 10.0),
                    // ******************************* Add a profile picture
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Add a profile picture',
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
                    UploadPhoto(fullName: full_name, username: username, password: password.toString()),
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
                    color: Colors.white,
                  colorOpacity: 1,
                  enabled: cubit_step3.shimmer_button,
                  direction: ShimmerDirection.fromLBRT(),
                  child: customButton(
                    function: cubit_step3.onpressed_button,
                    text: "Continue",
                    colorBorderside: cubit_step3.borderSide_button,
                    backColor: cubit_step3.backGround_button,
                    colorText: cubit_step3.text_button,
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
