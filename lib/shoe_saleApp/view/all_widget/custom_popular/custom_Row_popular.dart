import 'package:flutter/material.dart';

import '../text_widget/custom_text.dart';

class CustompupularItem extends StatelessWidget {
  const CustompupularItem({
    super.key, this.title, this.subtitle, this.onpressed,
  });
  final String? title;
  final String? subtitle;
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextWidget(
          txt: "${title}",
          color: Colors.black,
          fonsize: 20,
          fontWeight: FontWeight.bold,
        ),
        TextButton(
          onPressed: onpressed,
          child: CustomTextWidget(
            txt: "${subtitle}",
            fonsize: 17,
            color: Colors.black.withAlpha(400),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
