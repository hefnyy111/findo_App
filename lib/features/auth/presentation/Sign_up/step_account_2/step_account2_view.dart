// // features/auth/presentation/Sign_up/step_account_2/step_account2_view.dart
// import 'package:Ascend/features/auth/presentation/Sign_up/step_account_2/manager/step_account2_cubit.dart';
// import 'package:Ascend/features/auth/presentation/Sign_up/step_account_2/manager/step_account2_states.dart';
// import 'package:Ascend/features/auth/presentation/Sign_up/widgets/step_progress.dart';
// import 'package:Ascend/shared/Components/components.dart';
// import 'package:Ascend/shared/core/constants/app_router.dart';
// import 'package:Ascend/shared/core/constants/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:shimmer_animation/shimmer_animation.dart';

// class StepAccount2View extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => StepAccount2Cubit(),
//       child: BlocConsumer<StepAccount2Cubit, StepAccount2States>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           var cubit_step2 = StepAccount2Cubit.get(context);
//           return Scaffold(
//             backgroundColor: AppColors.kbackgroundColor,
//             appBar: AppBar(
//               backgroundColor: AppColors.kbackgroundColor,
//               leading: customIconback(
//                 funtions: () {
//                   GoRouter.of(context).go(AppRouter.kGetStartedView);
//                 },
//               ),
//             ),
//             body: Padding(
//               padding: EdgeInsets.all(20.0),

//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // ******************************* Step Progress
//                   StepProgress(currentStep: 2, totalSteps: 5),
//                   // ******************************* Sizebox
//                   SizedBox(height: 60.0),
//                   // ******************************* Secure your account
//                   Align(
//                     alignment: Alignment.bottomLeft,
//                     child: Text(
//                       'Secure your account',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         height: 1.4,
//                       ),
//                     ),
//                   ),
//                   // ******************************* Sizebox
//                   SizedBox(height: 10.0),
//                   // *******************************
//                   Align(
//                     alignment: Alignment.bottomLeft,
//                     child: Text(
//                       'You can set a password now or skip for later',
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                         color: AppColors.kGreyColor,
//                         fontSize: 13,
//                         height: 1.3,
//                       ),
//                     ),
//                   ),
//                   // ******************************* Sizebox
//                   SizedBox(height: 30.0),
//                   // ******************************* Field 1
//                   customTextFormField(
//                     controller: cubit_step2.password,
//                     validate: (value) {
//                       cubit_step2.validatePassWord(value!);
//                     },
//                     onChanged: (value) {},
//                     text: "Password",
//                   ),
//                   // ******************************* Sizebox
//                   SizedBox(height: 20.0),
//                   // ******************************* Field 2
//                   customTextFormField(
//                     controller: cubit_step2.confirm_password,
//                     validate: (value) {
//                       cubit_step2.validatePassWord(value!);
//                     },
//                     onChanged: (value) {},
//                     text: "Repeat password",
//                   ),
//                 const  PassWordVaildate(),
//                 ],
//               ),
//             ),
//             // ******************************* Button Next
//             bottomNavigationBar: Padding(
//               padding: EdgeInsets.all(24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadiusGeometry.circular(25),
//                     child: Shimmer(
//                       duration: Duration(seconds: 4),
//                       interval: Duration(seconds: 1),
//                       color: Colors.grey,
//                       colorOpacity: 1,
//                       enabled: true,
//                       direction: ShimmerDirection.fromLBRT(),
//                       child: customButton(
//                         function: () {},
//                         text: "Next",
//                         colorBorderside: AppColors.kPrimaryColor,
//                         backColor: AppColors.kPrimaryColor,
//                         colorText: Colors.white,
//                         width: double.infinity,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15.0),
//                   TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       'Skip',
//                       style: TextStyle(
//                         color: AppColors.kGreyColor,
//                         fontSize: 13,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class PassWordVaildate extends StatelessWidget {
//   const PassWordVaildate({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CustomVaidateUser(),
//         SizedBox(height: 10),
//         CustomVaidateUser(),
//         SizedBox(height: 10),
//         CustomVaidateUser(),
//         SizedBox(height: 10),
//         CustomVaidateUser(),
//       ],
//     );
//   }
// }

// class CustomVaidateUser extends StatelessWidget {
//   const CustomVaidateUser({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Icon(Icons.remove_done, color: AppColors.kGreyColor),
//       title: Text(
//         'passWord is contain 8 digits',
//         style: TextStyle(fontSize: 18, color: AppColors.kGreyColor),
//       ),
//     );
//   }
// }
