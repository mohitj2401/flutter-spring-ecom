import 'package:ecom_spring/models/productCategory.dart';

class Product {
  int? id;
  int? unitsInStock;
  double? unitPrice;
  String? sku;
  String? name;
  String? description;
  String? imgUrl;
  ProductCategory? productCategory;

  Product({
    this.id,
    this.description,
    this.imgUrl,
    this.name,
    this.sku,
    this.unitsInStock,
    this.productCategory,
    this.unitPrice,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    name = json['name'];
    description = json['description'];
    imgUrl = json['imageUrl'];
    unitPrice = json['unitPrice'];
    unitsInStock = json['unitsInStock'];
    productCategory = ProductCategory.fromJson(json['category']);
  }
}
