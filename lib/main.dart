import 'package:e_comerce_app/shoe_saleApp/view/ui/home_screen/home_screen.dart';
import 'package:e_comerce_app/shoe_saleApp/view/ui/item_details/product_details_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductDetailsScreen(),
    );
  }
}
