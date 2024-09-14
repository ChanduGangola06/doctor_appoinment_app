import 'package:doctor_appoinment_app/component/common_button.dart';
import 'package:doctor_appoinment_app/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/common_text_field.dart';
import '../../../constants/text_style_const.dart';
import '../../../utils/image_utils.dart';
import '../../../utils/string_utils.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: MyColors.whiteColor,
          body: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Form(
                key: formKey,
                child: Column(
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
                      height: height / 1.6,
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        bottom: mediaQuery.viewInsets.bottom,
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
                            children: [
                              Text(StringUtils.forgotPassword,
                                  style: TextStyleConst.boldTextStyle(
                                      MyColors.blueColor, width * 0.06)),
                              SizedBox(height: height * 0.01),
                              Text(StringUtils.forgotScreenDetail,
                                  style: TextStyleConst.hintTextStyle(
                                      MyColors.hintGreyColor),
                                  textAlign: TextAlign.center),
                              SizedBox(height: height * 0.05),
                              CommonTextField(
                                keyBoardType: TextInputType.emailAddress,
                                controller: emailController,
                                hintText: StringUtils.signInEmail,
                                validator: (value) {
                                  if (emailController.text.isEmpty) {
                                    return "Please enter an email";
                                  }
                                  if (!RegExp(
                                          r"[a-zA-Z0-9+_.-]+@[a-zA-Z.-]+\.[a-z]+")
                                      .hasMatch(value!)) {
                                    return "Please enter valid email";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: height * 0.07),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: CommonButton(
                                        textStyleConst:
                                            TextStyleConst.mediumTextStyle(
                                                MyColors.whiteColor,
                                                width * 0.05),
                                        onTap: () {},
                                        color: MyColors.blueColor,
                                        text: StringUtils.sendLink,
                                        width: width / 2.3,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                  CommonButton(
                                    textStyleConst:
                                        TextStyleConst.mediumTextStyle(
                                            MyColors.hintGreyColor,
                                            width * 0.05),
                                    onTap: () {
                                      Get.back();
                                      emailController.clear();
                                    },
                                    color: MyColors.borderGreyColor,
                                    text: StringUtils.cancel,
                                    width: width / 2.3,
                                    height: 50,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
