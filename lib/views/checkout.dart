import 'package:ecom_spring/constants/color.dart';
import 'package:ecom_spring/models/address.dart';
import 'package:ecom_spring/models/cart.dart';
import 'package:ecom_spring/models/country.dart';
import 'package:ecom_spring/models/order-item.dart';
import 'package:ecom_spring/models/order.dart';
import 'package:ecom_spring/models/purchase.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ndialog/ndialog.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CheckoutScreen extends StatefulWidget {
  final Cart cart;
  const CheckoutScreen({Key? key, required this.cart}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController zipcode = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController country = TextEditingController();
  bool checked = true;
  int quantity = 0;
  var formKey = GlobalKey<FormState>();
  // late Razorpay _razorpay;
  // increament() {
  //   quantity++;
  // }

  // decreament() {
  //   quantity = quantity > 1 ? quantity-- : quantity;
  // }

  submit() {
    if (formKey.currentState!.validate()) {
      Address address = Address(
        firstName: firstName.text,
        lastName: lastName.text,
        email: email.text,
        phone: phone.text,
        state: state.text,
        city: city.text,
        country: country.text,
        zipCode: zipcode.text,
      );
      // print(address);
      List<OrderItem> orderItems = [];
      widget.cart.cartDetails!.forEach((element) {
        quantity = quantity + element.quantity!;
        orderItems.add(OrderItem(
          imageUrl: element.product!.imageUrl,
          unitPrice: element.product!.unitPrice,
          quantity: element.quantity,
          productId: element.product!.id,
        ));
      });
      Order order =
          Order(totalPrice: widget.cart.totalAmount!, totalQuantity: quantity);
      Purchase purchase = Purchase(
        billingAddress: address,
        shippingAddress: address,
        orderItems: orderItems,
        order: order,
      );
      context.go('/home/cart/payment', extra: purchase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: bgColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundColor: darkbgColor,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: darkbgColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 3,
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: darkbgColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 3,
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: darkbgColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundColor: darkbgColor,
                        child: Icon(
                          Icons.shopping_cart_checkout,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                alignment: Alignment.topLeft,
                child: const Text(
                  "Shipping Address",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                getTextFieldWithLable(
                                  hintText: "Enter First Name",
                                  textEditingController: firstName,
                                  onValidate: (value) {
                                    if (value!.isEmpty) {
                                      return "Field is required";
                                    }
                                    return null;
                                  },
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                getTextFieldWithLable(
                                  hintText: "Enter Last Name",
                                  textEditingController: lastName,
                                  onValidate: (value) {
                                    if (value!.isEmpty) {
                                      return "Field is required";
                                    }
                                    return null;
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: getTextFieldWithLable(
                        hintText: "Enter Phone Number",
                        textEditingController: phone,
                        onValidate: (value) {
                          if (value!.isEmpty) {
                            return "Field is required";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: getTextFieldWithLable(
                        hintText: "Email",
                        textEditingController: email,
                        onValidate: (value) {
                          if (value!.isEmpty) {
                            return "Field is required";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: getTextFieldWithLable(
                        hintText: "Enter City Name",
                        textEditingController: city,
                        onValidate: (value) {
                          if (value!.isEmpty) {
                            return "Field is required";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: getTextFieldWithLable(
                        hintText: "Enter State Name",
                        textEditingController: state,
                        onValidate: (value) {
                          if (value!.isEmpty) {
                            return "Field is required";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: getTextFieldWithLable(
                        hintText: "Enter Country Name",
                        textEditingController: country,
                        onValidate: (value) {
                          if (value!.isEmpty) {
                            return "Field is required";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: getTextFieldWithLable(
                        hintText: "Enter Street",
                        textEditingController: street,
                        onValidate: (value) {
                          if (value!.isEmpty) {
                            return "Field is required";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                        // color: darkbgColor,
                        decoration: BoxDecoration(
                          color: checked
                              ? darkbgColor
                              : darkbgColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: const Text(
                        "Billing address same as shipping address",
                        style: TextStyle(color: textColor),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: darkbgColor,
                  ),
                  onPressed: () {
                    submit();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Payment",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      )),
    );
  }
}

Widget getTextFieldWithLable({
  required TextEditingController textEditingController,
  required String hintText,
  required String? Function(String?) onValidate,
  bool isObsecure = false,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextFormField(
          controller: textEditingController,
          validator: onValidate,
          obscureText: isObsecure,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.2),
              ),
            ),
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.2),
              ),
            ),
            hintStyle: const TextStyle(color: Colors.grey),
          ),
        )
      ],
    ),
  );
}
