import 'package:doctor_appoinment_app/constants/my_colors.dart';
import 'package:doctor_appoinment_app/constants/text_style_const.dart';
import 'package:doctor_appoinment_app/utils/image_utils.dart';
import 'package:doctor_appoinment_app/utils/string_utils.dart';
import 'package:flutter/material.dart';

class FirstOnBoardingScreen extends StatelessWidget {
  final double height;
  final double width;
  const FirstOnBoardingScreen(
      {super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            ImageUtils.onBoardingBg,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height / 3.2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageUtils.introOne),
              ),
            ),
          ),
          SizedBox(height: height * 0.06),
          Text(
            StringUtils.introOneTitle,
            style: TextStyleConst.boldTextStyle(Colors.black, width * 0.06),
          ),
          SizedBox(height: height * 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              StringUtils.introOneSubTitle,
              textAlign: TextAlign.center,
              style: TextStyleConst.hintTextStyle(MyColors.hintGreyColor),
            ),
          ),
        ],
      ),
    );
  }
}
