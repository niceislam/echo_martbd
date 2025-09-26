import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comerce_app/shoe_saleApp/class/carousel/carousel_image.dart';
import 'package:flutter/material.dart';

import '../../all_widget/custom_txtfield/custom_txtfield.dart';
import '../../all_widget/text_widget/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE0E0E0),
      appBar: AppBar(
        backgroundColor: Color(0xffE0E0E0),
        leading: Icon(Icons.widgets, color: Color(0xffFF7A7F), size: 30),
        centerTitle: true,
        title: CustomTextWidget(
          txt: "Home",
          fonsize: 22,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          Stack(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Center(
                  child: Icon(Icons.shopping_bag_outlined, color: Colors.grey),
                ),
              ),
              Positioned(
                right: 5,
                top: 7,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.red,
                  child: Center(
                    child: Text(
                      "2",
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 7),
          CircleAvatar(
            radius: 19,
            backgroundColor: Colors.red,
            backgroundImage: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzK62S_-B0xK3LwJAuxGrpagQ-bE9xaGNlZnzLw4qiJMzKEXH0Jnp_ScnxQp4fkfzTN-4&usqp=CAU",
            ),
          ),
          SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 13, left: 13),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      flex: 5,
                      child: CustomTextfield(
                        hinttext: "Search...",
                        sufIcon: InkWell(
                          onTap: () {},
                          child: Icon(Icons.search, color: Colors.grey),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Card(
                        color: Color(0xffFF7A7F),
                        child: SizedBox(
                          height: 48,
                          child: Center(
                            child: Icon(
                              Icons.tune,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    CarouselSlider(
                      items: CarouselImage().carousel.map((v) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage("$v"),
                            ),
                            color: Colors.red,
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        onPageChanged: (index, j) {
                          currentIndex = index;
                          setState(() {});
                        },
                        height: 150,
                        autoPlay: true,
                        enlargeFactor: 0.3,
                        enlargeCenterPage: true,
                        autoPlayInterval: Duration(seconds: 8),
                        autoPlayAnimationDuration: Duration(seconds: 2),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: CarouselImage().carousel
                          .asMap()
                          .entries
                          .map(
                            (item) => Container(
                              height: 7,
                              width: 7,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == item.key
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(),
        ],
      ),
    );
  }
}
