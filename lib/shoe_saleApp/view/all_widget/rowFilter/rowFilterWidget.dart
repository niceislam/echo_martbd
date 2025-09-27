import 'package:flutter/material.dart';

import '../text_widget/custom_text.dart';

class CustomRowfilter extends StatelessWidget {
  const CustomRowfilter({
    super.key,
    this.title,
    this.icon,
    this.boxBorder,
    this.iconColor,
    this.txtcolor,
  });
  final String? title;
  final IconData? icon;
  final BoxBorder? boxBorder;
  final Color? iconColor;
  final Color? txtcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: boxBorder,
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor),
            CustomTextWidget(
              txt: "${title ?? ""}",
              color: txtcolor,
              fontWeight: FontWeight.w500,
              fonsize: 17,
            ),
          ],
        ),
      ),
    );
  }
}
