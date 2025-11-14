// features/auth/presentation/Sign_up/step_account_3/manager/step_account3_cubit.dart
import 'dart:io';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/manager/step_account3_states.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class StepAccount3Cubit extends Cubit<StepAccount3States> {
  StepAccount3Cubit() : super(StepAccount3InitialStates());

  static StepAccount3Cubit get(context) => BlocProvider.of(context);

  // ******************************* Inputs
  final imagePicker = ImagePicker();
  File? profileImage;
  
  Future<void> pickAndCropImage() async {
    try {
      final picked = await imagePicker.pickImage(source: ImageSource.gallery);
      if (picked == null) return;

      final cropped = await ImageCropper().cropImage(
        sourcePath: picked.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Upload photo',
            toolbarColor: AppColors.kbackgroundColor,
            statusBarColor: AppColors.kbackgroundColor,
            dimmedLayerColor: AppColors.kbackgroundColor,
            backgroundColor: AppColors.kbackgroundColor,
            toolbarWidgetColor: Colors.white,
            lockAspectRatio: true,
            cropFrameColor: Colors.transparent,
            cropGridColor: AppColors.kbackgroundColor,
            activeControlsWidgetColor: AppColors.kPrimaryColor,
            cropStyle: CropStyle.circle
          ),
          IOSUiSettings(title: 'Edit photo'),
        ],
      );
      if (cropped == null) return;

      profileImage = File(cropped.path);
      emit(ProfileImageSelected(File(cropped.path)));
    } catch (er) {
      print('error :');
    }
  }

  
}
