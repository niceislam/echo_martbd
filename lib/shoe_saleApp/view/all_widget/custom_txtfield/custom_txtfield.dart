import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.hinttext,
    this.borderSide,
    this.preIcon,
    this.sufIcon,
    this.onchanged,
  });
  final String? hinttext;
  final BorderSide? borderSide;
  final InkWell? preIcon;
  final InkWell? sufIcon;
  final ValueChanged? onchanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onchanged,
      cursorColor: Colors.grey,
      cursorHeight: 22,
      decoration: InputDecoration(
        suffixIcon: sufIcon,
        prefixIcon: preIcon,
        hintText: "${hinttext ?? ""}",
        hintStyle: TextStyle(color: Colors.grey),
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: borderSide ?? BorderSide.none,
        ),
      ),
    );
  }
}
