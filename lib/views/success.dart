import 'package:ecom_spring/constants/color.dart';
import 'package:ecom_spring/models/purchase.dart';
import 'package:ecom_spring/services/shopping.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PurchaseSuccess extends StatelessWidget {
  final String orderId;
  const PurchaseSuccess({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              color: bgColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    // onTap: () => context.pop(),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        child: null,
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
                        color: Colors.grey,
                      ),
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
                        color: Colors.grey,
                      ),
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
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.transparent,
                      child: null,
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
              alignment: Alignment.center,
              child: const Text(
                "Payment Successfull",
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              alignment: Alignment.center,
              child: Text(
                "Your order tracking id is ${orderId}",
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
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
                    context.pop();
                    // checkout();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Go Home",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Icon(Icons.arrow_back_ios_new)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      )),
    );
  }
}
