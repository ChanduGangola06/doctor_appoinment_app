import 'package:doctor_appoinment_app/component/common_app_bar.dart';
import 'package:doctor_appoinment_app/constants/my_colors.dart';
import 'package:doctor_appoinment_app/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/text_style_const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.whiteColor,
        key: scaffoldKey,
        appBar: CommonAppBar(
          title: StringUtils.appointment,
          leadOnTap: () {
            scaffoldKey.currentState?.openDrawer();
          },
          leadIcon: const Icon(Icons.menu, color: MyColors.blackColor),
        ),
        drawer: Drawer(
          width: width / 1.2,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: height * 0.02),
              ListTile(
                title: Text(
                  'Mohan',
                  style: TextStyleConst.mediumTextStyle(
                    MyColors.blackColor,
                    width * 0.045,
                  ),
                ),
                subtitle: Text(
                  'abc@gmail.com',
                  style: TextStyleConst.mediumTextStyle(
                    MyColors.hintGreyColor,
                    width * 0.035,
                  ),
                ),
                leading: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1718006517981-b03b000e2d8a?q=80&w=1973&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
                ),
              ),
              SizedBox(height: height * 0.01),
              Container(
                height: 1.5,
                width: double.infinity,
                color: MyColors.borderGreyColor,
              ),
              const Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
