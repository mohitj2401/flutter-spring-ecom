// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:ecom_spring/models/address.dart';
import 'package:ecom_spring/models/order-item.dart';
import 'package:ecom_spring/models/order.dart';

class Purchase {
  // customer!: Customer;
  Address? shippingAddress;
  Address? billingAddress;
  Order? order;
  List<OrderItem>? orderItems;
  Purchase({
    this.shippingAddress,
    this.billingAddress,
    this.order,
    this.orderItems,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shippingAddress': shippingAddress?.toMap(),
      'billingAddress': billingAddress?.toMap(),
      'order': order?.toMap(),
      'orderItems': orderItems!.map((x) => x.toMap()).toList(),
    };
  }

  factory Purchase.fromMap(Map<String, dynamic> map) {
    return Purchase(
      shippingAddress: map['shippingAddress'] != null
          ? Address.fromMap(map['shippingAddress'] as Map<String, dynamic>)
          : null,
      billingAddress: map['billingAddress'] != null
          ? Address.fromMap(map['billingAddress'] as Map<String, dynamic>)
          : null,
      order: map['order'] != null
          ? Order.fromMap(map['order'] as Map<String, dynamic>)
          : null,
      orderItems: map['orderItems'] != null
          ? List<OrderItem>.from(
              (map['orderItems'] as List<int>).map<OrderItem?>(
                (x) => OrderItem.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Purchase.fromJson(String source) =>
      Purchase.fromMap(json.decode(source) as Map<String, dynamic>);
}
