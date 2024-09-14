import 'package:flutter/material.dart';

import '../constants/my_colors.dart';
import '../constants/text_style_const.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback leadOnTap;
  final Icon leadIcon;

  const CommonAppBar({
    super.key,
    required this.title,
    required this.leadOnTap,
    required this.leadIcon,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        leading: IconButton(
          onPressed: leadOnTap,
          icon: leadIcon,
        ),
        backgroundColor: MyColors.whiteColor,
        elevation: 3,
        centerTitle: true,
        shadowColor: MyColors.greyShadowColor,
        title: Text(
          title,
          style: TextStyleConst.boldTextStyle(
            MyColors.blackColor,
            width * 0.05,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
