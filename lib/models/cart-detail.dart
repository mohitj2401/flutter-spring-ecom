// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CartDetail {
  int? id;
  int? product_id;
  int? quantity;
  double? unit_price;
  CartDetail({
    this.id,
    this.product_id,
    this.quantity,
    this.unit_price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product_id': product_id,
      'quantity': quantity,
      'unit_price': unit_price,
    };
  }

  factory CartDetail.fromMap(Map<String, dynamic> map) {
    return CartDetail(
      id: map['id'] != null ? map['id'] as int : null,
      product_id: map['product_id'] != null ? map['product_id'] as int : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      unit_price:
          map['unit_price'] != null ? map['unit_price'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartDetail.fromJson(String source) =>
      CartDetail.fromMap(json.decode(source) as Map<String, dynamic>);
}
