class ProductModel {
  String? name;
  String? details;
  double? price;
  double? rating;
  String? availability;
  String? imageUrl;

  ProductModel(
      {this.name,
        this.details,
        this.price,
        this.rating,
        this.availability,
        this.imageUrl});

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    details = json['details'];
    price = json['price'];
    rating = json['rating'];
    availability = json['availability'];
    imageUrl = json['image_url'];
  }}
