// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Order {
  int? totalQuantity;
  double? totalPrice;
  Order({
    this.totalQuantity,
    this.totalPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalQuantity': totalQuantity,
      'totalPrice': totalPrice,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      totalQuantity:
          map['totalQuantity'] != null ? map['totalQuantity'] as int : null,
      totalPrice:
          map['totalPrice'] != null ? map['totalPrice'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);
}
