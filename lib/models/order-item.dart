import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderItem {
  String? imageUrl;
  double? unitPrice;
  int? quantity;
  int? productId;
  OrderItem({
    this.imageUrl,
    this.unitPrice,
    this.quantity,
    this.productId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageUrl': imageUrl,
      'unitPrice': unitPrice,
      'quantity': quantity,
      'productId': productId,
    };
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      unitPrice: map['unitPrice'] != null ? map['unitPrice'] as double : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      productId: map['productId'] != null ? map['productId'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItem.fromJson(String source) =>
      OrderItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
