import 'package:Ascend/features/auth/presentation/sign_in/manager/cubit/verify_code_cubit.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class AnimatedOtPCode extends StatelessWidget {
  const AnimatedOtPCode({
    super.key,
    this.controller,
    this.focusNode,
    this.onTap,
    required this.borderColor,
    required this.digits,
    required this.boxIndex,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final Color borderColor;
  final List<String> digits;
  final int boxIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyCodeCubit, VerifyCodeState>(
      builder: (context, state) {
        final verifyCubit = VerifyCodeCubit.get(context);

        bool showSuccess = verifyCubit.isCodeValid;
        bool attempted = verifyCubit.isCodeAttempted;
        bool shimmerEnabled = verifyCubit.enabledShimmer;

        return GestureDetector(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Shimmer(
              duration: Duration(seconds: 4),
              interval: Duration(seconds: 1),
              color: Colors.grey.shade500,
              colorOpacity: 0.4,
              enabled: shimmerEnabled,
              direction: const ShimmerDirection.fromLBRT(),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                width: 90,
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color:
                      attempted
                          ? (showSuccess
                              ? Colors.lightBlue.withOpacity(0.15)
                              : Colors.red.withOpacity(0.15))
                          : Colors.grey,
                  borderRadius: BorderRadius.circular(16),
                  border:
                      attempted
                          ? null
                          : showSuccess
                          ? null
                          : Border.all(color: borderColor, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: borderColor.withOpacity(0.15),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child:
                      attempted
                          ? Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              color:
                                  showSuccess
                                      ? AppColors.kPrimaryColor
                                      : Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              showSuccess ? Icons.check : Icons.close,
                              color: Colors.white,
                              size: 14,
                            ),
                          )
                          : Stack(
                            alignment: Alignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: List.generate(3, (i) {
                                  return AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 300),
                                    transitionBuilder: (child, animation) {
                                      return SlideTransition(
                                        position: Tween<Offset>(
                                          begin: const Offset(0, 1),
                                          end: Offset.zero,
                                        ).animate(animation),
                                        child: child,
                                      );
                                    },
                                    child: Text(
                                      digits[i],
                                      key: ValueKey('${digits[i]}$i'),
                                      style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            digits[i] == "0"
                                                ? Colors.grey.shade800
                                                : Colors.black,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              Opacity(
                                opacity: 0,
                                child: TextField(
                                  controller: controller,
                                  focusNode: focusNode,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(3),
                                  ],
                                  onChanged: (val) {
                                    verifyCubit.handleInputChange(
                                      val,
                                      boxIndex,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
