import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    this.content,
    this.title,
    this.yesbutton,
  });

  final Widget? content;
  final Widget? title;
  final VoidCallback? yesbutton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: title,
      content: content,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Card(
                color: Colors.green,
                child: SizedBox(
                  height: 35,
                  width: 60,
                  child: Center(
                    child: Icon(Icons.close, size: 28, color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: yesbutton,
              child: Card(
                color: Colors.red,
                child: SizedBox(
                  height: 35,
                  width: 60,
                  child: Center(
                    child: Icon(Icons.check, size: 28, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
