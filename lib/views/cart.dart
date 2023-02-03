import 'package:ecom_spring/constants/color.dart';
import 'package:ecom_spring/constants/variables.dart';
import 'package:ecom_spring/models/cart-detail.dart';
import 'package:ecom_spring/models/cart.dart';
import 'package:ecom_spring/services/shopping.dart';
import 'package:ecom_spring/widgets/bottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class CartDetailScreen extends StatefulWidget {
  const CartDetailScreen({Key? key}) : super(key: key);

  @override
  State<CartDetailScreen> createState() => _CartDetailScreenState();
}

class _CartDetailScreenState extends State<CartDetailScreen> {
  Cart? cart;
  bool isLoading = true;
  ShoppingService shoppingService = ShoppingService();
  getCart() {
    ShoppingService shoppingService = ShoppingService();
    shoppingService.getCart().then((value) {
      if (value.statusCode == 200) {
        cart = value.output as Cart;
      } else {
        cart = null;
      }
      if (value.statusCode == 401) {
        context.go('/login');
      }
      isLoading = false;
      // print(cart?.cartDetails);
      setState(() {});
    });
  }

  int quantity = 1;

  increament(CartDetail cartDetail) {
    cartDetail.quantity = cartDetail.quantity! + 1;
    setState(() {});

    // ShoppingService shoppingService = ShoppingService();
    shoppingService.addToCart(cartDetail).then((value) => getCart());
  }

  decreament(CartDetail cartDetail) {
    int qty = cartDetail.quantity!;
    if (qty > 1) {
      cartDetail.quantity = cartDetail.quantity! - 1;
      setState(() {});
      // ShoppingService shoppingService = ShoppingService();
      shoppingService.addToCart(cartDetail).then((value) => getCart());
    } else {
      shoppingService.deleteitemFromCart(cartDetail).then((value) => getCart());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getBottomNavigationBar(context, 1),
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
                    // Container(),
                    const SizedBox(
                      width: 40,
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
              if (cart == null && isLoading == false)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: const Text(
                    "Your cart is empty.",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (isLoading)
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  enabled: isLoading,
                  child: ListView.builder(
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
                                      child: null,
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
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
                                                    backgroundColor:
                                                        darkbgColor,
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const CircleAvatar(
                                                    backgroundColor:
                                                        darkbgColor,
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
                    itemCount: 1,
                  ),
                ),
              if (!isLoading)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) {
                    // print(cart!.cartDetails![index].id);
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
                          // height: 130,
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
                                      imageUrl +
                                          cart!.cartDetails![index].product!
                                              .imageUrl!,
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cart!.cartDetails![index].product!
                                              .name!,
                                          style: const TextStyle(
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
                                            Text(
                                              "₹${(cart!.cartDetails![index].product!.unitPrice!)}",
                                              style: const TextStyle(
                                                color: textColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    decreament(cart!
                                                        .cartDetails![index]);
                                                  },
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        darkbgColor,
                                                    child: Container(
                                                      width: 10,
                                                      height: 2,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "${cart!.cartDetails![index].quantity!}",
                                                  style: const TextStyle(
                                                    color: textColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    increament(cart!
                                                        .cartDetails![index]);
                                                  },
                                                  child: const CircleAvatar(
                                                    backgroundColor:
                                                        darkbgColor,
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    ),
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
                  itemCount: cart != null ? cart!.cartDetails!.length : 0,
                ),
              const SizedBox(
                height: 20,
              ),
              if (cart != null && isLoading == false) const Divider(),
              const SizedBox(
                height: 20,
              ),
              if (cart != null && isLoading == false)
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                            color: textColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        cart == null ? "0" : "₹${cart!.totalAmount}",
                        style: const TextStyle(
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
              if (cart != null && isLoading == false)
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
                      context.go('/home/cart/checkout', extra: cart);
                    },
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
