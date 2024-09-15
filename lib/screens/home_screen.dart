import 'package:doctor_appoinment_app/component/common_app_bar.dart';
import 'package:doctor_appoinment_app/constants/my_colors.dart';
import 'package:doctor_appoinment_app/controller/home_controller.dart';
import 'package:doctor_appoinment_app/utils/image_utils.dart';
import 'package:doctor_appoinment_app/utils/list_utils.dart';
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
      child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (homeController) {
            return Scaffold(
              backgroundColor: MyColors.whiteColor,
              key: scaffoldKey,
              appBar: CommonAppBar(
                title: homeController.appBarTitle.value,
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
                        icon: const Icon(Icons.arrow_forward_ios_rounded,
                            size: 15),
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Container(
                      height: 1.5,
                      width: double.infinity,
                      color: MyColors.borderGreyColor,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: List.generate(ListUtils.drawerList.length,
                              (index) {
                            return ListTile(
                              onTap: () {
                                homeController.changeWidget(index);
                              },
                              title: Text(
                                ListUtils.drawerList[index]['title'],
                                style: TextStyleConst.mediumTextStyle(
                                  MyColors.blackColor,
                                  width * 0.04,
                                ),
                              ),
                              leading: SizedBox(
                                height: 25,
                                width: 25,
                                child: ImageIcon(
                                  AssetImage(
                                      ListUtils.drawerList[index]['icon']),
                                  color: MyColors.hintGreyColor,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    Container(
                      height: 1.5,
                      width: double.infinity,
                      color: MyColors.borderGreyColor,
                    ),
                    SizedBox(height: height * 0.002),
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: ListTile(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const Center();
                            },
                          );
                        },
                        title: const Text(StringUtils.logOut),
                        leading: const SizedBox(
                          height: 25,
                          width: 25,
                          child: ImageIcon(
                            AssetImage(ImageUtils.logOutIcon),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                  ],
                ),
              ),
              body: PopScope(
                onPopInvoked: (didPop) {
                  false;
                },
                child: homeController.currentWidget,
              ),
            );
          }),
    );
  }
}
