// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ecom_spring/models/cart-detail.dart';

class Cart {
  int? id;
  int? userId;
  List<CartDetail>? cartDetails;
  double? totalAmount;
  String? dateCreated;
  String? lastUpdated;
  Cart({
    this.id,
    this.userId,
    this.cartDetails,
    this.totalAmount,
    this.dateCreated,
    this.lastUpdated,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'cartDetails': cartDetails!.map((x) => x.toMap()).toList(),
      'totalAmount': totalAmount,
      'dateCreated': dateCreated,
      'lastUpdated': lastUpdated,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id'] != null ? map['id'] as int : null,
      userId: map['userId'] != null ? map['userId'] as int : null,
      cartDetails: map['cartDetails'] != null
          ? List<CartDetail>.from(
              (map['cartDetails'] as List<dynamic>).map<CartDetail?>(
                (x) => CartDetail.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      totalAmount:
          map['totalAmount'] != null ? map['totalAmount'] as double : null,
      dateCreated:
          map['dateCreated'] != null ? map['dateCreated'] as String : null,
      lastUpdated:
          map['lastUpdated'] != null ? map['lastUpdated'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) =>
      Cart.fromMap(json.decode(source) as Map<String, dynamic>);
}
