import 'package:Ascend/features/auth/presentation/Sign_up/step_account_4/action/step_account4_action.dart';
import 'package:Ascend/features/auth/presentation/Sign_up/step_account_4/manager/step_account4_cubit.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  final String full_name;
  final String username;
  final String password;
  final String photo_url;

  const AboutMe({super.key, required this.full_name, required this.username, required this.password, required this.photo_url});

  @override
  Widget build(BuildContext context) {
          var cubit_step4 = StepAccount4Cubit.get(context);
    return Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            color: AppColors.kbackGroundField,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ************** Description
                                Text('About me',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                ),
                                SizedBox(height: 10.0,),
                                // ************** Field
                                Expanded(
                                  child: TextField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 8,
                                    maxLength: 500,
                                    controller: cubit_step4.bio,
                                    cursorColor: AppColors.kPrimaryColor,
                                    style: TextStyle(color: Colors.white, fontSize: 12),
                                    onChanged: (value) {
                                      cubit_step4.changeButton(value, onClickButton: () => StepAccount4Action.StepAccount_4Action(full_name, username, password, photo_url, context, "finish", value: value)
                                      );
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Write something about yourself here',
                                      hintStyle: TextStyle(color: Colors.grey[500], fontSize: 12),
                                      counterText: "${cubit_step4.bio.text.length}/500 characters",
                                      counterStyle: TextStyle(color: AppColors.kGreyColor),
                                      filled: true,
                                      fillColor: AppColors.kbackgroundColor,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide.none
                                      ),
                                      contentPadding: EdgeInsets.all(10)
                                    ),
                                  ),
                                ),
                    
                              ],
                            ),
                          ),
                        );
  }
}