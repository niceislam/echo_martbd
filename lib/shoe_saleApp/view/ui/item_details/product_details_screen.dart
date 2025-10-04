import 'package:e_comerce_app/shoe_saleApp/view/all_widget/text_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import '../../all_widget/custom_alertdialog/custom_alertdialog.dart';
import '../../all_widget/quantity_button/quantity_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    this.name,
    this.details,
    this.image,
    this.status,
    this.price,
    this.rating,
  });
  final String? name;
  final String? details;
  final String? image;
  final String? status;
  final double? price;
  final double? rating;
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
        scrolledUnderElevation: 0.0,
        backgroundColor: Color(0xffE0E0E0),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, size: 23),
        ),
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
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      "${widget.image ?? "https://cdn-icons-png.flaticon.com/512/2748/2748558.png"}",
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
                          txt: "${widget.name ?? ""}",
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
                        txt: "\$${count * num.parse("${widget.price ?? 0}")}",
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
                    "${widget.details ?? ""}",
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
                        txt: "${widget.status ?? ""}",
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
                        value: widget.rating ?? 0,
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
        child: Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.transparent,
                  border: Border.all(color: Colors.grey, width: 2),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart_outlined, size: 32),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: InkWell(
                onTap: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (c) => CustomAlertDialog(
                      content: Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Divider(thickness: 2),
                          CustomTextWidget(txt: "Name: ${widget.name ?? ""}"),
                          CustomTextWidget(txt: "Quantity: ${count}"),
                          CustomTextWidget(
                            txt:
                                "Price: \$ ${count * num.parse("${widget.price ?? 0}")}",
                          ),
                          Divider(thickness: 2),
                          CustomTextWidget(
                            txt: "Are you sure to purchase it ?",
                          ),
                        ],
                      ),
                      title: CustomTextWidget(txt: "Confirmation", fonsize: 25),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.indigoAccent,
                  ),
                  child: Center(
                    child: CustomTextWidget(
                      txt: "Buy Now",
                      fontWeight: FontWeight.w500,
                      fonsize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
