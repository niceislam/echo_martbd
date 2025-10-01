import 'dart:developer';

import 'package:e_comerce_app/shoe_saleApp/class/container_color/color_list.dart';
import 'package:e_comerce_app/shoe_saleApp/controller/product_controller/product_controller.dart';
import 'package:e_comerce_app/shoe_saleApp/model/shoe_model/product_model.dart';
import 'package:e_comerce_app/shoe_saleApp/view/all_widget/product_container/product_container.dart';
import 'package:e_comerce_app/shoe_saleApp/view/all_widget/text_widget/custom_text.dart';
import 'package:flutter/material.dart';

import '../../all_widget/custom_txtfield/custom_txtfield.dart';

class ViewAllProduct extends StatefulWidget {
  const ViewAllProduct({super.key});

  @override
  State<ViewAllProduct> createState() => _ViewAllProductState();
}

class _ViewAllProductState extends State<ViewAllProduct> {
  List<ProductModel> allProduct = [];
  List<ProductModel> searchProduct = [];
  bool isLoading = true;
  getAllItem() async {
    isLoading = true;
    searchProduct = await ProductController().makeModel();
    allProduct = searchProduct;
    isLoading = false;
    setState(() {});
  }

  searchFun({required String searchData})  {
    allProduct = searchProduct
        .where((v) => v.name!.toLowerCase().contains(searchData.toLowerCase()))
        .toList();
  }

  @override
  void initState() {
    getAllItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE0E0E0),
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Color(0xffE0E0E0),

        centerTitle: true,
        title: CustomTextWidget(
          txt: "All Product",
          color: Colors.black,
          fonsize: 22,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              spacing: 8,
              children: [
                Expanded(
                  flex: 5,
                  child: CustomTextfield(
                    onchanged: (value){
                      if (value != "") {
                        searchFun(searchData: '$value');
                      } else {
                        allProduct = searchProduct;
                      }
                      setState(() {});
                    },
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
                        child: Icon(Icons.tune, color: Colors.white, size: 30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 5, right: 13, left: 13),
        child: Column(
          children: [
            isLoading == true
                ? Center(child: CircularProgressIndicator(color: Colors.black))
                : Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6444,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: allProduct.length,
                      itemBuilder: (context, index) {
                        final item = allProduct[index];
                        return ProductContainer(
                          imagelink: item.imageUrl,
                          title: item.name,
                          price: item.price,
                          rating: item.rating,
                          containerColor:
                              ContainerColor().contrastingColors[index %
                                  ContainerColor().contrastingColors.length],
                        );
                      },
                    ),
                  ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
