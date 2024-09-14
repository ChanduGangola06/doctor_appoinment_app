import 'package:doctor_appoinment_app/constants/my_colors.dart';
import 'package:doctor_appoinment_app/screens/patient/splash/welcome_screen.dart';
import 'package:doctor_appoinment_app/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToNext();
  }

  goToNext() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Get.to(() => WelcomeScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.whiteColor,
        body: Center(
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
      ),
    );
  }
}
