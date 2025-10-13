// faatures/authentocation/presentaition/select_account/select_account_view.dart
import 'package:findo/faatures/authentocation/presentaition/select_account/Cubit/select_account_cubit.dart';
import 'package:findo/faatures/authentocation/presentaition/select_account/Cubit/select_account_states.dart';
import 'package:findo/shared/Components/components.dart';
import 'package:findo/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SelectAccountView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectAccountCubit(),
      child: BlocConsumer<SelectAccountCubit, SelectAccountStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit_select = SelectAccountCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.black,

            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ====================== Sizebox ======================
                  const SizedBox(height: 100.0),
                  // ====================== Findo ======================
                  const Text(
                    'Findo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'SF-Pro-Rounded-Bold',
                      color: AppColors.kPrimaryColor,
                      fontSize: 30,
                    ),
                  ),
                  // ====================== Sizebox ======================
                  const SizedBox(height: 40.0),
                  // ====================== Create your account ======================
                  const Text(
                    'Create Your Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'SF-Pro-Rounded-Bold',
                      color: Color.fromARGB(255, 233, 227, 227),
                      fontSize: 27,
                    ),
                  ),
                  // ====================== Sizebox ======================
                  const SizedBox(height: 15.0),
                  // ====================== What brings you here ======================
                  const Text(
                    'What brings you here?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  ),
                  // ====================== Sizebox ======================
                  const SizedBox(height: 60.0),
                  // ====================== Select accounts ======================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ====== Button 1 ======
                      Expanded(
                        child: GestureDetector(
                          onTap: () => cubit_select.changeSelection( 1, customFunction: () => print('1'),),

                          child: Container(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                              height: 270,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.kbackGroundField,
                                border: cubit_select.selectedIndex == 1 ? Border.all(color: AppColors.kPrimaryColor,width: 2.5,): null,
                                
                               boxShadow: cubit_select.selectedIndex == 1
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
                          onTap: () => cubit_select.changeSelection( 2, customFunction: () => print('2')),
                          
                          child: Container(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                              height: 270,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.kbackGroundField,
                                border: cubit_select.selectedIndex == 2 ?  Border.all(color: AppColors.kPrimaryColor, width: 2.5,) : null,
                              boxShadow: cubit_select.selectedIndex == 2 ? 
                              [
                                BoxShadow(
                                  color: AppColors.kPrimaryColor.withOpacity(0.5),
                                  blurRadius: 15,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 5), 
                                ),
                              ] : [],
                              
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
                  ),
                  // ====================== Sizebox ======================
                  const SizedBox(height: 100.0),
                  // ====================== Button ======================
                  ClipRRect(
                     borderRadius: BorderRadius.circular(25),
                    child: Shimmer(
                      duration: Duration(seconds: 4),
                      interval: Duration(seconds: 1),
                      color: Colors.white,
                      colorOpacity: 1,
                      enabled: cubit_select.startShimmer,
                      direction: ShimmerDirection.fromLBRT(),
                      child: customButton(
                        function: cubit_select.functionButton,
                        text: "Continue",
                        colorBorderside: cubit_select.buttonEnable,
                        backColor: cubit_select.buttonEnable,
                        colorText: Colors.black,
                        width: 180,
                      ),
                    ),
                  ),
                  // ====================== Sizebox ======================
                  const SizedBox(height: 30.0),
                  // ====================== OnBoarding ======================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.circle, 
                      color: cubit_select.selectedIndex == 1 ? AppColors.kPrimaryColor : AppColors.kbackGroundField,
                      size: 15.0,
                      ),
                      SizedBox(width: 10.0,),
                      Icon(Icons.circle, 
                      color: cubit_select.selectedIndex == 2 ? AppColors.kPrimaryColor : AppColors.kbackGroundField,
                      size: 15.0,
                      ),
                    ],
                  ),
                  // ====================== Sizebox ======================
                  const SizedBox(height: 20.0),
              
                  
                ],
              ),
            ),
                // ====================== Button naviage ======================
            bottomNavigationBar: Container(
            width: double.infinity,
            height: 55.0,
            decoration: BoxDecoration(color: Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have an account already?',
                    style: TextStyle(color: Colors.white70, fontSize: 14.5),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontFamily: 'SF-Pro-Text-Black',
                        color: AppColors.kPrimaryColor,
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
            ),
          );
        },
      ),
    );
  }
}
