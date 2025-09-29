import 'package:e_comerce_app/shoe_saleApp/model/database/product_data.dart';
import 'package:e_comerce_app/shoe_saleApp/model/shoe_model/product_model.dart';

class ProductController {
  Future<List<ProductModel>> makeModel() async {
    List<ProductModel> ModelData = [];
    await Future.delayed(Duration(seconds: 2));
    for (var i in ProductData().PJson) {
      var model = ProductModel.fromJson(i);
      ModelData.add(model);
    }
    return ModelData;
  }
}
