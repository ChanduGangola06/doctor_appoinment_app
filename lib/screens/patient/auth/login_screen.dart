import 'package:doctor_appoinment_app/component/common_button.dart';
import 'package:doctor_appoinment_app/component/common_text_field.dart';
import 'package:doctor_appoinment_app/constants/my_colors.dart';
import 'package:doctor_appoinment_app/screens/home_screen.dart';
import 'package:doctor_appoinment_app/screens/patient/auth/forgot_password_screen.dart';
import 'package:doctor_appoinment_app/screens/patient/auth/sign_up_screen.dart';
import 'package:doctor_appoinment_app/utils/image_utils.dart';
import 'package:doctor_appoinment_app/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/text_style_const.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          backgroundColor: MyColors.bgGreyColor,
          body: PopScope(
            onPopInvoked: (didPop) => false,
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                // top logo
                Container(
                  alignment: Alignment.center,
                  height: height / 3.2,
                  color: MyColors.bgGreyColor,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImageUtils.splashLogo),
                      ),
                    ),
                  ),
                ),

                // bottom
                Container(
                  height: height / 1.53,
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  decoration: BoxDecoration(
                    color: MyColors.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: MyColors.greyShadowColor,
                        blurRadius: 5,
                        spreadRadius: 3,
                        offset: const Offset(0, -5),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: height * 0.06),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(height: height * 0.06),
                          Text(
                            StringUtils.signIn,
                            style: TextStyleConst.boldTextStyle(
                                Colors.black, width * 0.06),
                          ),
                          SizedBox(height: height * 0.03),
                          CommonTextField(
                            controller: emailController,
                            keyBoardType: TextInputType.emailAddress,
                            validator: (p0) {
                              return null;
                            },
                            hintText: StringUtils.signInEmail,
                          ),
                          SizedBox(height: height * 0.02),
                          CommonTextField(
                            validator: (p0) {
                              return null;
                            },
                            controller: passwordController,
                            maxLine: 1,
                            hintText: StringUtils.signInPassword,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              child: const Text(
                                StringUtils.forgotPassword,
                              ),
                              onPressed: () {
                                Get.to(() => const ForgotPasswordScreen(),
                                    transition: Transition.rightToLeft);
                              },
                            ),
                          ),
                          SizedBox(height: height * 0.03),
                          CommonButton(
                            width: width,
                            height: 50,
                            text: StringUtils.login,
                            color: MyColors.blueColor,
                            onTap: () {
                              Get.to(() => const HomeScreen());
                            },
                            textStyleConst: TextStyleConst.mediumTextStyle(
                                MyColors.whiteColor, width * 0.05),
                          ),
                          SizedBox(height: height * 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "New here?",
                                style: TextStyleConst.mediumTextStyle(
                                  MyColors.hintGreyColor,
                                  width * 0.035,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const SignUpScreen());
                                },
                                child: Text(
                                  " Sign up",
                                  style: TextStyleConst.mediumTextStyle(
                                    MyColors.blueColor,
                                    width * 0.035,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.04),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
