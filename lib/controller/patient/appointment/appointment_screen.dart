import 'package:doctor_appoinment_app/constants/my_colors.dart';
import 'package:flutter/material.dart';

import '../../../constants/text_style_const.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: MyColors.whiteColor,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 70,
                margin: EdgeInsets.only(top: height * 0.01),
                width: double.infinity,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(
                              left: width * 0.03, right: index == 3 ? 10 : 0),
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2,
                              color: MyColors.borderGreyColor,
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'MRI',
                                style: TextStyleConst.mediumTextStyle(
                                    MyColors.hintGreyColor, width * 0.04),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              //
            ],
          ),
        ],
      ),
    );
  }
}
