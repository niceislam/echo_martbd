import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    this.txt,
    this.color,
    this.fontWeight,
    this.overflow,
    this.textDecoration,
    this.fonsize, this.maxLine,
  });
  final String? txt;
  final Color? color;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  final double? fonsize;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLine ?? 1,
      txt ?? "",
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: fonsize ?? 18,
        fontWeight: fontWeight ?? FontWeight.w300,
        overflow: overflow,
        decoration: textDecoration ?? TextDecoration.none,
      ),
    );
  }
}
