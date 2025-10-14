// faatures/authentocation/presentaition/select_account/views/widgets/custom_select_acount.dart
import 'package:findo/faatures/authentocation/presentaition/select_account/Cubit/select_account_cubit.dart';
import 'package:findo/shared/core/constants/constants.dart' show AppColors;
import 'package:flutter/material.dart';
class CustomSelectAcount extends StatelessWidget {
  const CustomSelectAcount({super.key, required this.cubit_select});

  final SelectAccountCubit cubit_select;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // ====== Button 1 ======
        Expanded(
          child: GestureDetector(
            onTap: () => cubit_select.changeSelection(1,customFunction: () => print('1'),),

            child: Container(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                height: 270,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.kbackGroundField,
                  border:
                      cubit_select.selectedIndex == 1
                          ? Border.all(
                            color: AppColors.kPrimaryColor,
                            width: 2.5,
                          )
                          : null,

                  boxShadow:
                      cubit_select.selectedIndex == 1
                          ? [
                            BoxShadow(
                              color: AppColors.kPrimaryColor.withOpacity(0.5),
                              blurRadius: 15,
                              spreadRadius: 2,
                              offset: const Offset(0, 5),
                            ),
                          ]
                          : [],
                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 15.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // ====== Image ======
                      Image.asset(
                        'assets/images/Auth/select_account/customer.png',
                        color: AppColors.kPrimaryColor,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                      // ====== Sizebox ======
                      const SizedBox(height: 25.0),
                      // ====== Text 1 ======
                      const Text(
                        'Account Personal',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      // ====== Sizebox ======
                      const SizedBox(height: 15.0),
                      // ====== Text 2 ======
                      const Text(
                        'Browse local business\n and connect your community',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.kGreyColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        // ====== Sizebox ======
        const SizedBox(width: 12.0),
        // ====== Button 2 ======
        Expanded(
          child: GestureDetector(
            onTap: () => cubit_select.changeSelection(2,customFunction: () => print('2'),),

            child: Container(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                height: 270,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.kbackGroundField,
                  border:
                      cubit_select.selectedIndex == 2
                          ? Border.all(
                            color: AppColors.kPrimaryColor,
                            width: 2.5,
                          )
                          : null,
                  boxShadow:
                      cubit_select.selectedIndex == 2
                          ? [
                            BoxShadow(
                              color: AppColors.kPrimaryColor.withOpacity(0.5),
                              blurRadius: 15,
                              spreadRadius: 2,
                              offset: const Offset(0, 5),
                            ),
                          ]
                          : [],
                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 15.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // ====== Image ======
                      Image.asset(
                        'assets/images/Auth/select_account/business.png',
                        color: AppColors.kPrimaryColor,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                      // ====== Sizebox ======
                      const SizedBox(height: 25.0),
                      // ====== Text 1 ======
                      const Text(
                        'Own a Business',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                          height: 1.3,
                        ),
                      ),
                      // ====== Sizebox ======
                      const SizedBox(height: 15.0),
                      // ====== Text 2 ======
                      const Text(
                        'Create your mini-app\nand grow your brand',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.kGreyColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
