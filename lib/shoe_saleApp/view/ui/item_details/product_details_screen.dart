import 'package:e_comerce_app/shoe_saleApp/view/all_widget/text_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import '../../all_widget/quantity_button/quantity_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double value = 0;
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: false,
        backgroundColor: Color(0xffE0E0E0),
        leading: Icon(Icons.arrow_back_ios, size: 23),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            Container(
              height: 290,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Color(0xffE0E0E0),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    height: 280,
                    width: 280,
                    image: NetworkImage(
                      "https://static.vecteezy.com/system/resources/previews/048/040/130/non_2x/ornate-wooden-dining-chair-with-carved-back-png.png",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 100,
                        child: CustomTextWidget(
                          txt:
                              "jdfljlsfdjalsjdfasldfalkfjaldsfjlpeorljslfjalsdfjljdfljaslfjalksdfd name",
                          color: Colors.black,
                          fonsize: 23,
                          fontWeight: FontWeight.bold,
                          maxLine: 4,
                        ),
                      ),
                      Expanded(
                        flex: 12,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_outline, size: 30),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QuantityButon(
                        increment: () {
                          count++;
                          setState(() {});
                        },
                        decrement: () {
                          if (count > 0) {
                            count--;
                          }
                          setState(() {});
                        },
                        count: "$count",
                      ),
                      CustomTextWidget(
                        txt: "\$${count * 8.00}",
                        fontWeight: FontWeight.bold,
                        fonsize: 25,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  CustomTextWidget(
                    txt: "Product Details:",
                    color: Colors.black,
                    fonsize: 20,
                    fontWeight: FontWeight.bold,
                    maxLine: 4,
                  ),
                  Text(
                    "This is a product details sjdflaj sldfjal sdjflkjsdf This is a product details sjdflaj sldfjal sdjflkjsdf ljasldfjlsdjf asdj fkjsdlkf asjdfljsld fjljsdfj lasjf asldkfjlsdf This is a product details sjdflaj sldfjal sdjflkjsdf ljasldfjlsdjf asdj fkjsdlkf asjdfljsld fjljsdfj lasjf asldkfjlsdf This is a product details sjdflaj sldfjal sdjflkjsdf ljasldfjlsdjf asdj fkjsdlkf asjdfljsld fjljsdfj lasjf asldkfjlsdf This is a product details sjdflaj sldfjal sdjflkjsdf ljasldfjlsdjf asdj fkjsdlkf asjdfljsld fjljsdfj lasjf asldkfjlsdf This is a product details sjdflaj sldfjal sdjflkjsdf ljasldfjlsdjf asdj fkjsdlkf asjdfljsld fjljsdfj lasjf asldkfjlsdf This is a product details sjdflaj sldfjal sdjflkjsdf ljasldfjlsdjf asdj fkjsdlkf asjdfljsld fjljsdfj lasjf asldkfjlsdf This is a product details sjdflaj sldfjal sdjflkjsdf ljasldfjlsdjf asdj fkjsdlkf asjdfljsld fjljsdfj lasjf asldkfjlsdf ljasldfjlsdjf asdj fkjsdlkf asjdfljsld fjljsdfj lasjf asldkfjlsdf asldkfj alsjdfl lkakjsdlfj aslkdjf ",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        txt: "Status",
                        color: Colors.black,
                        fonsize: 20,
                        fontWeight: FontWeight.bold,
                        maxLine: 4,
                      ),
                      CustomTextWidget(
                        txt: "Out of Stock",
                        color: Colors.red,
                        fonsize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        txt: "Reviews",
                        color: Colors.black,
                        fonsize: 20,
                        fontWeight: FontWeight.bold,
                        maxLine: 4,
                      ),
                      RatingStars(
                        value: 3.7,
                        starBuilder: (index, color) =>
                            Icon(Icons.star, color: color),
                        starCount: 5,
                        starSize: 20,

                        maxValue: 5,
                        starSpacing: 2,
                        maxValueVisibility: true,
                        valueLabelVisibility: true,
                        starOffColor: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 50,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.greenAccent,
          ),
        ),
      ),
    );
  }
}
