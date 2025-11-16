// features/auth/presentation/Sign_up/step_account_3/step_account3_view.dart
import 'dart:io';

import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/manager/step_account3_cubit.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/manager/step_account3_states.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/widgets/DashedBorderPainter.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/widgets/step_progress.dart';
import 'package:Ascend/shared/Components/components.dart';
import 'package:Ascend/shared/core/constants/app_router.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class StepAccount3View extends StatelessWidget {
  final String full_name;
  final String username;
  final String password;

  StepAccount3View({required this.full_name, required this.username, required this.password});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StepAccount3Cubit(),
      child: BlocConsumer<StepAccount3Cubit, StepAccount3States>(
        listener: (context, state) {
          
        },
        builder: (context, state) {

          var cubit_step3 = StepAccount3Cubit.get(context);
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
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // ************** الخط المتقطع حوالين الصورة
                      SizedBox(
                        width: 220,
                        height: 220,
                        child: CustomPaint(painter: DashedBorderPainter()),
                      ),

                      // ************** الصورة
                      CircleAvatar(
                        radius: 100,
                        backgroundColor: AppColors.kbackGroundField,
                        child: ClipOval(
                          child: cubit_step3.profileImage != null ? 
                           Image.file(
                            cubit_step3.profileImage!,
                            fit: BoxFit.cover,
                            width: 240,
                            height: 240,
                           ) :
                           Image.network(
                            'src',
                            fit: BoxFit.cover,
                            width: 240,
                            height: 240,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            errorBuilder:
                                (context, error, stackTrace) => const Icon(
                                  Icons.person,
                                  size: 100,
                                  color: Colors.grey,
                                ),
                          ),
                        ),
                      ),

                      // ************** زرار الكاميرا
                      Positioned(
                        bottom: 8,
                        right: 8,
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: AppColors.kPrimaryColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: IconButton(
                            onPressed: cubit_step3.pickAndCropImage,
                            icon: Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
                    text: "Continue",
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
