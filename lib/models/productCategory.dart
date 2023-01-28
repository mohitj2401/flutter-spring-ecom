class ProductCategory {
  String? code;
  String? name;
  int? id;
  ProductCategory({this.code, this.name, this.id});

  ProductCategory.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    id = json['id'];
    name = json['categoryName'];
  }
}
