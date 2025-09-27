import 'package:flutter/material.dart';

import '../text_widget/custom_text.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    this.imagelink,
    this.title,
    this.price,
    this.containerColor,
    this.rating,
  });
  final String? imagelink;
  final String? title;
  final double? price;
  final Color? containerColor;
  final double? rating;

  @override
  Widget build(BuildContext context) {
    bool favicon = true;
    return Container(
      height: 270,
      width: MediaQuery.sizeOf(context).width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: containerColor ?? Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    favicon = !favicon;
                  },
                  child: favicon == true
                      ? Icon(
                          Icons.favorite_outline,
                          size: 28,
                          color: Colors.grey,
                        )
                      : Icon(
                          Icons.favorite,
                          size: 28,
                          color: Color(0xffFF7A7F),
                        ),
                ),
              ],
            ),
            Center(
              child: FadeInImage(
                height: 130,
                width: 150,
                placeholder: NetworkImage("https://i.sstatic.net/kOnzy.gif"),
                image: NetworkImage("${imagelink}"),
                imageErrorBuilder: (context, j, k) {
                  return Image.network(
                    height: 130,
                    width: 150,
                    "https://cdn-icons-png.flaticon.com/512/2748/2748558.png",
                  );
                },
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              width: 120,
              child: CustomTextWidget(
                txt: "${title ?? ""}",
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                fonsize: 17,
              ),
            ),
            CustomTextWidget(
              txt: "\$${price ?? ""}",
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
              fonsize: 20,
            ),
            SizedBox(height: 5),
            Row(
              spacing: 2,
              children: [
                Icon(Icons.star, color: Colors.amber),
                Text("${rating ?? ""}", style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
