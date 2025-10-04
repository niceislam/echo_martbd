import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comerce_app/shoe_saleApp/model/shoe_model/product_model.dart';
import 'package:e_comerce_app/shoe_saleApp/view/ui/item_details/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../class/carousel/carousel_image.dart';
import '../../../class/container_color/color_list.dart';
import '../../../controller/product_controller/product_controller.dart';
import '../../all_widget/custom_popular/custom_Row_popular.dart';
import '../../all_widget/product_container/product_container.dart';
import '../../all_widget/rowFilter/rowFilterWidget.dart';
import '../home_screen/home_screen.dart';
import '../view_all/all_product.dart';

class BottomPage0 extends StatefulWidget {
  const BottomPage0({super.key});

  @override
  State<BottomPage0> createState() => _BottomPage0State();
}

class _BottomPage0State extends State<BottomPage0> {
  List<ProductModel> finalData = [];
  bool isLoading = true;
  getData() async {
    isLoading = true;
    dynamic a = await ProductController().makeModel();
    isLoading = false;
    finalData = a;
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  int currentIndexCarousel = 0;
  int FilterIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5, right: 13, left: 13),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                        currentIndexCarousel = index;
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
                              color: currentIndexCarousel == item.key
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
        SizedBox(height: 15),
        Row(
          spacing: 10,
          children: [
            Expanded(
              child: SizedBox(
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: FilterIcon().IconList.length,
                  itemBuilder: (context, index) {
                    final item = FilterIcon().IconList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: () {
                          FilterIndex = index;
                          setState(() {});
                        },
                        child: CustomRowfilter(
                          boxBorder: FilterIndex == index
                              ? BoxBorder.all(color: Colors.pink)
                              : BoxBorder.all(color: Colors.white),
                          iconColor: FilterIndex == index
                              ? Color(0xffFF7A7F)
                              : Colors.black,
                          txtcolor: FilterIndex == index
                              ? Color(0xffFF7A7F)
                              : Colors.black,

                          icon: item['Icon'],
                          title: "${item['title']}",
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              CustompupularItem(
                title: "Popular",
                subtitle: "View All",
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) => ViewAllProduct()),
                  );
                },
              ),
              isLoading == true
                  ? Center(
                      child: CircularProgressIndicator(color: Colors.black),
                    )
                  : GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.677,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: finalData.length,
                      itemBuilder: (context, index) {
                        final item = finalData[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) => ProductDetailsScreen(
                                  image: item.imageUrl,
                                  price: item.price,
                                  rating: item.rating,
                                  details: item.details,
                                  name: item.name,
                                  status: item.availability,
                                ),
                              ),
                            );
                          },
                          child: ProductContainer(
                            containerColor:
                                ContainerColor().contrastingColors[index %
                                    ContainerColor().contrastingColors.length],
                            title: item.name,
                            price: double.parse("${item.price}"),
                            rating: double.parse("${item.rating}"),
                            imagelink: item.imageUrl,
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
