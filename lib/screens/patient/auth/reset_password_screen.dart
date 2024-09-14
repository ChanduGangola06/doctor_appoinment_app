import 'package:doctor_appoinment_app/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/common_button.dart';
import '../../../component/common_text_field.dart';
import '../../../constants/text_style_const.dart';
import '../../../utils/image_utils.dart';
import '../../../utils/string_utils.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          backgroundColor: MyColors.whiteColor,
          body: ListView(
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
                    height: height / 1.54,
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
                            Text(
                              StringUtils.resetPassword,
                              style: TextStyleConst.boldTextStyle(
                                  Colors.black, width * 0.06),
                            ),
                            SizedBox(height: height * 0.03),
                            CommonTextField(
                              controller: newPasswordController,
                              keyBoardType: TextInputType.emailAddress,
                              validator: (value) {
                                return null;
                              },
                              hintText: StringUtils.enterNewPassword,
                            ),
                            SizedBox(height: height * 0.02),

                            /// password TextField
                            CommonTextField(
                              maxLine: 1,
                              controller: confirmPasswordController,
                              validator: (value) {
                                return null;
                              },
                              hintText: StringUtils.enterNewPassword,
                            ),
                            SizedBox(height: height * 0.06),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonButton(
                                  textStyleConst:
                                      TextStyleConst.mediumTextStyle(
                                          MyColors.whiteColor, width * 0.05),
                                  onTap: () {},
                                  color: MyColors.blueColor,
                                  text: StringUtils.save,
                                  width: width / 2.3,
                                  height: 50,
                                ),
                                CommonButton(
                                  textStyleConst:
                                      TextStyleConst.mediumTextStyle(
                                          MyColors.hintGreyColor, width * 0.05),
                                  onTap: () {
                                    Get.back();
                                  },
                                  color: MyColors.borderGreyColor,
                                  text: StringUtils.cancel,
                                  width: width / 2.3,
                                  height: 50,
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.04)
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
