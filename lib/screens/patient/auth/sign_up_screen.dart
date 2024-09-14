import 'package:doctor_appoinment_app/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/common_button.dart';
import '../../../component/common_text_field.dart';
import '../../../constants/text_style_const.dart';
import '../../../utils/image_utils.dart';
import '../../../utils/string_utils.dart';

enum Gender { male, female }

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  Gender _gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          backgroundColor: MyColors.bgGreyColor,
          body: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Column(
                children: [
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
                  Container(
                    padding: EdgeInsets.only(
                      bottom: mediaQuery.viewInsets.bottom,
                    ),
                    height: height / 1.53,
                    width: double.infinity,
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
                        topRight: Radius.circular(60),
                        topLeft: Radius.circular(60),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.06, left: 20, right: 20),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                StringUtils.patientRegistration,
                                style: TextStyleConst.boldTextStyle(
                                  Colors.black,
                                  width * 0.06,
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.03),

                            /// First Name TextField
                            CommonTextField(
                              controller: firstNameController,
                              keyBoardType: TextInputType.emailAddress,
                              validator: (value) {
                                return null;
                              },
                              hintText: "Enter First Name",
                            ),
                            SizedBox(height: height * 0.02),

                            /// Last Name TextField
                            CommonTextField(
                              controller: lastNameController,
                              keyBoardType: TextInputType.emailAddress,
                              validator: (value) {
                                return null;
                              },
                              hintText: "Enter Last Name",
                            ),
                            SizedBox(height: height * 0.02),

                            /// Email TextField
                            CommonTextField(
                              controller: emailController,
                              keyBoardType: TextInputType.emailAddress,
                              validator: (value) {
                                return null;
                              },
                              hintText: "Enter Email Address",
                            ),
                            SizedBox(height: height * 0.02),
                            CommonTextField(
                              controller: passwordController,
                              maxLine: 1,
                              keyBoardType: TextInputType.emailAddress,
                              validator: (value) {
                                return null;
                              },
                              hintText: "Enter Password",
                            ),
                            SizedBox(height: height * 0.02),

                            /// Confirm password TextField
                            CommonTextField(
                              controller: cPasswordController,
                              keyBoardType: TextInputType.emailAddress,
                              validator: (value) {
                                return null;
                              },
                              maxLine: 1,
                              hintText: "Re-enter Password",
                            ),
                            SizedBox(height: height * 0.02),

                            Text(
                              "Select Gender:",
                              style: TextStyleConst.boldTextStyle(
                                MyColors.blackColor,
                                width * 0.04,
                              ),
                            ),
                            SizedBox(height: height * 0.015),
                            SizedBox(
                              height: 30,
                              width: 195,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio(
                                    value: Gender.male,
                                    groupValue: _gender,
                                    onChanged: (value) {
                                      setState(() {
                                        _gender = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Male",
                                    style: TextStyleConst.hintTextStyle(
                                      MyColors.hintGreyColor,
                                    ),
                                  ),
                                  const SizedBox(width: 0),
                                  Radio(
                                    value: Gender.female,
                                    groupValue: _gender,
                                    onChanged: (value) {
                                      setState(() {
                                        _gender = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Female",
                                    style: TextStyleConst.hintTextStyle(
                                      MyColors.hintGreyColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.03),
                            CommonButton(
                              textStyleConst: TextStyleConst.mediumTextStyle(
                                  MyColors.whiteColor, width * 0.05),
                              onTap: () {},
                              color: MyColors.blueColor,
                              text: "Submit",
                              width: width,
                              height: 50,
                            ),
                            SizedBox(height: height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already User?",
                                  style: TextStyleConst.mediumTextStyle(
                                    MyColors.hintGreyColor,
                                    width * 0.035,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    " Sign In",
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
            ],
          ),
        ),
      ),
    );
  }
}
