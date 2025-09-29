import 'package:flutter/material.dart';

class bottomNavbar extends StatefulWidget {
  const bottomNavbar({super.key, this.currenIndex, this.ontap});
  final int? currenIndex;
  final ValueChanged<int>? ontap;

  @override
  State<bottomNavbar> createState() => _bottomNavbarState();
}

class _bottomNavbarState extends State<bottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: widget.ontap,
      currentIndex: widget.currenIndex!,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      selectedItemColor: Color(0xffFF7A7F),

      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
