import 'package:e_comerce_app/shoe_saleApp/view/all_widget/text_widget/custom_text.dart';
import 'package:flutter/material.dart';

class BottomPage1 extends StatefulWidget {
  const BottomPage1({super.key});

  @override
  State<BottomPage1> createState() => _BottomPage1State();
}

class _BottomPage1State extends State<BottomPage1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CustomTextWidget(
            txt: "Bottom Page 1",
            fonsize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
