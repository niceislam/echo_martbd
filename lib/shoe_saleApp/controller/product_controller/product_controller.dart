import 'package:e_comerce_app/shoe_saleApp/model/database/product_data.dart';
import 'package:e_comerce_app/shoe_saleApp/model/shoe_model/product_model.dart';

class ProductController {
   makeModel()  {
    List<ProductModel> ModelData = [];
    //await Future.delayed(Duration(seconds: 3));
    for (var i in ProductData().PJson) {
      var model = ProductModel.fromJson(i);
      ModelData.add(model);
    }
    return ModelData;
  }
}
