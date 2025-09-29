import 'package:flutter/material.dart';

import '../../all_widget/text_widget/custom_text.dart';

class BottomPage2 extends StatefulWidget {
  const BottomPage2({super.key});

  @override
  State<BottomPage2> createState() => _BottomPage2State();
}

class _BottomPage2State extends State<BottomPage2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CustomTextWidget(
            txt: "Bottom Page 2",
            fonsize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
    ;
  }
}
