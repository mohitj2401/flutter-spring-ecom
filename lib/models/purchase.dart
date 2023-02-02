// ignore_for_file: public_member_api_docs, sort_constructors_first

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
}
