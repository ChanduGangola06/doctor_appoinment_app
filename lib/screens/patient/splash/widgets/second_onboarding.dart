import 'package:doctor_appoinment_app/constants/my_colors.dart';
import 'package:doctor_appoinment_app/constants/text_style_const.dart';
import 'package:doctor_appoinment_app/utils/string_utils.dart';
import 'package:flutter/material.dart';

import '../../../../utils/image_utils.dart';

class SecondOnBoardingScreen extends StatelessWidget {
  final double height;
  final double width;
  const SecondOnBoardingScreen(
      {super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(ImageUtils.onBoardingBg),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height / 3.2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageUtils.introTwo),
              ),
            ),
          ),
          SizedBox(height: height * 0.06),
          Text(
            StringUtils.introTwoTitle,
            style: TextStyleConst.boldTextStyle(Colors.black, width * 0.06),
          ),
          SizedBox(height: height * 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              StringUtils.introTwoSubTitle,
              textAlign: TextAlign.center,
              style: TextStyleConst.hintTextStyle(MyColors.hintGreyColor),
            ),
          ),
        ],
      ),
    );
  }
}
