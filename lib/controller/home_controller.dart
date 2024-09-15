import 'package:doctor_appoinment_app/controller/patient/appointment/appointment_screen.dart';
import 'package:doctor_appoinment_app/controller/patient/bill/bills_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/string_utils.dart';

class HomeController extends GetxController {
  Widget currentWidget = AppointmentScreen();
  RxInt currentDrawerIndex = 0.obs;
  RxString appBarTitle = StringUtils.appointment.obs;
  RxBool isSetValue = false.obs;

  void changeWidget(int index) {
    Get.back();
    Get.deleteAll();
    update();
    switch (index) {
      case 0:
        currentWidget = AppointmentScreen();
        appBarTitle.value = StringUtils.appointment;
        currentDrawerIndex.value = 0;
        break;
      case 1:
        currentWidget = BillsScreen();
        appBarTitle.value = StringUtils.bills;
        currentDrawerIndex.value = 1;
        break;
    }
  }
}
