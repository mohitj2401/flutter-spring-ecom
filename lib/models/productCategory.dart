// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductCategory {
  // String? code;
  String categoryName;
  int id;
  ProductCategory(this.categoryName, this.id);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryName': categoryName,
      'id': id,
    };
  }

  factory ProductCategory.fromMap(Map<String, dynamic> map) {
    return ProductCategory(
      map['categoryName'] ?? "",
      map['id'] ?? null as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCategory.fromJson(String source) =>
      ProductCategory.fromMap(json.decode(source) as Map<String, dynamic>);
}
