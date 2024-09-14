import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  PageController controller = PageController();
  RxDouble index = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    controller.addListener(() {
      index.value = controller.page!;
      update();
    });
  }
}
