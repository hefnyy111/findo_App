// features/auth/presentation/verify_code/widgets/field_otp_view.dart
import 'package:Ascend/features/auth/presentation/verify_code/manager/verify_code_cubit.dart';
import 'package:Ascend/features/auth/presentation/verify_code/manager/verify_code_states.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class FieldOtpView extends StatelessWidget {
  final int startIndex;
  final int endIndex;
  final int currentBorderr;
  FieldOtpView({
    required this.startIndex,
    required this.endIndex,
    required this.currentBorderr,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyCodeCubit, VerifyCodeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubitVerify = VerifyCodeCubit.get(context);

        return ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(20),
          child: Shimmer(
            duration: Duration(milliseconds: 750),
            interval: Duration(milliseconds: 150),
            color: Colors.grey,
            colorOpacity: 1,
            enabled: cubitVerify.startShimmer,
            direction: ShimmerDirection.fromLBRT(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              decoration: BoxDecoration(
                color: cubitVerify.showCodeSuccess ? AppColors.kbutton_disabel : AppColors.kbackGroundField,
                border: cubitVerify.currentBorder == currentBorderr
                        ? Border.all(color: AppColors.kPrimaryColor, width: 2)
                        : Border.all(
                          color: AppColors.kbackgroundColor,
                          width: 2,
                        ), // بوردر عريض
                borderRadius: BorderRadius.circular(20),
              ),
              child: cubitVerify.showCodeSuccess ? SizedBox(
                              height: 60,
                              width: 120,
                              child: Center(
                                child: Lottie.asset(
                                  'assets/Images/Auth/Animations/success.json',
                                  width: 85,
                                  height: 85,
                                  repeat: false,
                                  delegates: LottieDelegates(
                                    values: [
                                      ValueDelegate.color(const [
                                        '**',
                                      ], value: AppColors.kPrimaryColor),
                                    ],
                                  ),
                                ),
                              ),
                            ) : Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(endIndex - startIndex, (index) {
                  final realIndex = startIndex + index;

                  return Container(
                    width: 30,
                    height: 50,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: TextField(
                              controller: cubitVerify.controllers[realIndex],
                              focusNode: cubitVerify.FocusNodee[realIndex],
                              showCursor: false,
                              keyboardType: TextInputType.number,
                              cursorWidth: 0,
                              enableInteractiveSelection: false,
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              decoration: const InputDecoration(
                                hintText: "0",
                                hintStyle: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white24,
                                ),
                                counterText: "",
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                cubitVerify.codeField(
                                  context,
                                  value,
                                  realIndex,
                                );
                                // cubitVerify.checkCode();
                                print(cubitVerify.controllers[0].text);
                              },
                            ),
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget customField() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      FieldOtpView(startIndex: 0, endIndex: 3, currentBorderr: 1),
      SizedBox(width: 20),
      FieldOtpView(startIndex: 3, endIndex: 6, currentBorderr: 2),
    ],
  );
}
