import 'dart:io';

import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/action/step_account3_action.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/manager/step_account3_cubit.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/manager/step_account3_states.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/widgets/DashedBorderPainter.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/widgets/show_bottom_sheet.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhoto extends StatelessWidget {
  final String fullName;
  final String username;
  final String password;

  const UploadPhoto({
    super.key,
    required this.fullName,
    required this.username,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepAccount3Cubit, StepAccount3States>(
      builder: (context, state) {
        var cubit = StepAccount3Cubit.get(context);

        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 220,
              height: 220,
              child: CustomPaint(painter: DashedBorderPainter()),
            ),

              // ******************************* الصورة
            ConditionalBuilder(
              condition: state is! ProfileImageLoading,
              builder: (context) {
                return CircleAvatar(
                  radius: 100,
                  backgroundColor: AppColors.kbackGroundField,
                  child: ClipOval(
                    child: cubit.profileImage != null
                        ? Image.file(
                            File(cubit.profileImage!.path),
                            width: 240,
                            height: 240,
                            fit: BoxFit.cover,
                          )
                        : const Icon(
                            Icons.person,
                            size: 100,
                            color: Colors.grey,
                          ),
                  ),
                );
              },
              fallback: (context) =>
                  CircularProgressIndicator(color: AppColors.kPrimaryColor),
            ),

              // ******************************* زر الكاميرا
            Positioned(
              bottom: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(Icons.add_a_photo),
                onPressed: () {
                  showModelBottomSheet(
                    context,
                    onPressed1: () async {
                      await cubit.pickAndCropImage(ImageSource.camera);
                    },
                    onPressed2: () async {
                      await cubit.pickAndCropImage(ImageSource.gallery);
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}