// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ecom_spring/models/productCategory.dart';

class Product {
  int? id;
  int? unitsInStock;
  double? unitPrice;
  String? sku;
  String? name;
  String? description;
  String? imageUrl;
  Product({
    this.id,
    this.unitsInStock,
    this.unitPrice,
    this.sku,
    this.name,
    this.description,
    this.imageUrl,
  });
  ProductCategory? category;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'unitsInStock': unitsInStock,
      'unitPrice': unitPrice,
      'sku': sku,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] != null ? map['id'] as int : null,
      unitsInStock:
          map['unitsInStock'] != null ? map['unitsInStock'] as int : null,
      unitPrice: map['unitPrice'] != null ? map['unitPrice'] as double : null,
      sku: map['sku'] != null ? map['sku'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
