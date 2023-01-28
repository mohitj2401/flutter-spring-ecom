import 'package:ecom_spring/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartDetailScreen extends StatefulWidget {
  const CartDetailScreen({Key? key}) : super(key: key);

  @override
  State<CartDetailScreen> createState() => _CartDetailScreenState();
}

class _CartDetailScreenState extends State<CartDetailScreen> {
  int quantity = 1;

  increament() {
    quantity++;
  }

  decreament() {
    quantity = quantity > 1 ? quantity-- : quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.black,
      //   leading: Container(
      //     padding: EdgeInsets.all(10),
      //     child: CircleAvatar(
      //       radius: 20,
      //       backgroundColor: darkbgColor,
      //       child: Icon(
      //         Icons.arrow_back,
      //         color: Colors.white,
      //       ),
      //     ),
      //   ),
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       Container(
      //         // color: Colors.red,
      //         width: 20,
      //         height: 20,
      //         decoration: BoxDecoration(
      //           color: Colors.red,
      //           borderRadius: BorderRadius.circular(30),
      //         ),
      //       ),
      //       Divider(
      //           // height: 2,
      //           // endIndent: 20,
      //           // thickness: 2,
      //           // indent: 20,
      //           // color: Colors.red,
      //           ),
      //       Container(
      //         decoration: BoxDecoration(
      //           color: Colors.red,
      //           borderRadius: BorderRadius.circular(30),
      //         ),
      //         width: 20,
      //         height: 20,
      //         child: Container(
      //           decoration: BoxDecoration(
      //             color: Colors.white,
      //             borderRadius: BorderRadius.circular(10),
      //           ),
      //           width: 10,
      //           height: 10,
      //           // backgroundColor: Colors.white,
      //         ),
      //       ),
      //       Divider(
      //         // height: 2,
      //         // endIndent: 20,
      //         thickness: 2,
      //         // indent: 20,
      //         color: Colors.red,
      //       ),
      //       Container(
      //         color: Colors.red,
      //         width: 20,
      //         height: 20,
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     IconButton(
      //         onPressed: () {},
      //         icon: Icon(
      //           Icons.shop_2,
      //           color: darkbgColor,
      //         ))
      //   ],
      // ),

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
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: Container(
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
                child: const Text(
                  "Shopping Cart",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Card(
                      color: Colors.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        //  width: 500,
                        height: 130,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: shadowColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.network(
                                    'https://picsum.photos/200/300',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.center,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Product Name",
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "₹234.00",
                                            style: TextStyle(
                                              color: textColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: darkbgColor,
                                                child: Container(
                                                  width: 10,
                                                  height: 2,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "$quantity",
                                                style: const TextStyle(
                                                  color: textColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const CircleAvatar(
                                                backgroundColor: darkbgColor,
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 3,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Total",
                      style: TextStyle(
                          color: textColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "₹234.00",
                      style: TextStyle(
                          color: textColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
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
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Checkout",
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
