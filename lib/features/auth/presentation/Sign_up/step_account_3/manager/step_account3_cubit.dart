// features/auth/presentation/Sign_up/step_account_3/manager/step_account3_cubit.dart
// features/auth/presentation/Sign_up/step_account_3/manager/step_account3_cubit.dart
import 'dart:io';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/manager/step_account3_states.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_3/manager/step_account3_states.dart';
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

  Future<void> pickAndCropImage(ImageSource source) async {
      emit(ProfileImageLoading());

    try {
      final picked = await imagePicker.pickImage(source: source);
      if (picked == null) return;

      final cropped = await ImageCropper().cropImage(
        sourcePath: picked.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: '',
            toolbarWidgetColor: Colors.transparent,
            toolbarColor: Colors.black.withOpacity(0.3),
            statusBarColor: Colors.black87,
            backgroundColor: Colors.black,
            dimmedLayerColor: Colors.black.withOpacity(0.7),

            // إخفاء الإطارات القديمة
            hideBottomControls: false,

            // لون الأزرار (Rotate / Flip / Aspect Ratio)
            activeControlsWidgetColor: AppColors.kPrimaryColor,

            // شكل الـ Crop Box
            cropFrameColor: Colors.white70,
            cropFrameStrokeWidth: 2,
            cropGridColor: Colors.white30,
            cropGridStrokeWidth: 1,

            // تثبيت الأسبكت ريشيو زي YouTube
            lockAspectRatio: true,
            initAspectRatio: CropAspectRatioPreset.square,
          ),
          IOSUiSettings(title: 'Edit photo'),
        ],
      );
      if (cropped == null) return;

      profileImage = File(cropped.path);
      
      await Future.delayed(const Duration(seconds: 3));

      emit(ProfileImageSelected(File(cropped.path)));
    } catch (er) {
      print('error :');
    }
  }

  // ******************************* Change button
  Color backGround_button = AppColors.kbutton_disabel;
  Color borderSide_button = AppColors.kbutton_disabel;
  Color text_button = AppColors.kGreyColor;
  bool shimmer_button = false;
  VoidCallback? onpressed_button;

  void changeButton( {VoidCallback? onClickButton}) {
    bool photo_select = profileImage != null;
    if (photo_select) {
      backGround_button = AppColors.kPrimaryColor;
      borderSide_button = AppColors.kPrimaryColor;
      text_button = Colors.white;
      shimmer_button = true;
      onpressed_button = onClickButton;
    } else {
      backGround_button = AppColors.kbutton_disabel;
      borderSide_button = AppColors.kbutton_disabel;
      text_button = AppColors.kGreyColor;
      shimmer_button = false;
      onpressed_button = null;
    }
    emit(StepAccount3VaildateUserStates());
  }

 
}
