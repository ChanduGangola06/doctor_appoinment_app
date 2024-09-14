import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final bool? isIcon;
  final Color color;
  final VoidCallback onTap;
  final TextStyle textStyleConst;
  const CommonButton({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    this.isIcon,
    required this.color,
    required this.onTap,
    required this.textStyleConst,
  });

  @override
  Widget build(BuildContext context) {
    return isIcon == true
        ? ElevatedButton.icon(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: color,
              elevation: 0,
              fixedSize: Size(width, height),
            ),
            icon: const Icon(Icons.videocam_rounded),
            label: Text(
              text,
              textAlign: TextAlign.center,
              style: textStyleConst,
            ),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: color,
              elevation: 0,
              fixedSize: Size(width, height),
            ),
            onPressed: onTap,
            child: Text(
              text,
              style: textStyleConst,
            ),
          );
  }
}
