import 'package:e_comerce_app/shoe_saleApp/view/ui/bottom_page/bottom_page_1.dart';
import 'package:e_comerce_app/shoe_saleApp/view/ui/bottom_page/bottom_page_2.dart';
import 'package:flutter/material.dart';
import '../../all_widget/custom_txtfield/custom_txtfield.dart';
import '../../all_widget/text_widget/custom_text.dart';
import '../bottom_navbar/bottom_navbar.dart';
import '../bottom_page/bottom_page_0.dart';

class FilterIcon {
  List<Map<String, dynamic>> IconList = [
    {"Icon": Icons.widgets, "title": "All"},
    {"Icon": Icons.keyboard, "title": "keyboard"},
    {"Icon": Icons.watch, "title": "Watch"},
    {"Icon": Icons.local_laundry_service, "title": "Decor"},
  ];
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List bottom_page = [BottomPage0(), BottomPage1(), BottomPage2()];
  int currenIndexBottom = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE0E0E0),
      appBar: currenIndexBottom == 0 || currenIndexBottom == 1
          ? AppBar(
              forceMaterialTransparency: true,
              backgroundColor: Color(0xffE0E0E0),
              leading: Icon(Icons.widgets, color: Color(0xffFF7A7F), size: 30),
              title: CustomTextWidget(
                txt: "Echo Mart BD",
                fonsize: 23,
                color: Color(0xffFF7A7F),
                fontWeight: FontWeight.bold,
              ),
              actions: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: Badge.count(
                        count: 3,
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
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
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(65),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
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
                ),
              ),
            )
          : AppBar(
              centerTitle: true,
              title: CustomTextWidget(txt: "hello bangali", fonsize: 22),
            ),
      body: SingleChildScrollView(child: bottom_page[currenIndexBottom]),
      bottomNavigationBar: bottomNavbar(
        currenIndex: currenIndexBottom,
        ontap: (value) {
          currenIndexBottom = value;
          setState(() {});
        },
      ),
    );
  }
}
