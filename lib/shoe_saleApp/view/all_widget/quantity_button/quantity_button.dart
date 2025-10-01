import 'package:flutter/material.dart';

class QuantityButon extends StatelessWidget {
  const QuantityButon({
    super.key, this.decrement, this.increment, this.count,
  });
  final VoidCallback? decrement;
  final VoidCallback? increment;
  final String? count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: decrement,
          icon: Icon(Icons.remove, color: Colors.black),
        ),
        Container(
          height: 25,
          width: 30,
          decoration: BoxDecoration(
            border: BoxBorder.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              "${count ?? 1}",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        IconButton(
          onPressed: increment,
          icon: Icon(Icons.add, color: Colors.black),
        ),
      ],
    );
  }
}
