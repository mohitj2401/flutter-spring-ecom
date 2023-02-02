import 'package:ecom_spring/constants/color.dart';
import 'package:ecom_spring/constants/variables.dart';
import 'package:ecom_spring/models/cart-detail.dart';
import 'package:ecom_spring/models/product.dart';
import 'package:ecom_spring/services/product_service.dart';
import 'package:ecom_spring/services/shopping.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;
  const ProductDetailScreen({Key? key, required this.productId})
      : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  bool isLoading = true;
  late Product product;
  getProductDeatil() {
    ProductService _productService = ProductService();
    _productService.productDetail(widget.productId).then((value) {
      if (value.statusCode == 200) {
        product = value.output! as Product;
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  addToCart() {
    CartDetail cartDetail = CartDetail(
        product_id: product.id,
        quantity: quantity,
        unit_price: product.unitPrice);
    ShoppingService shoppingService = ShoppingService();
    shoppingService.addToCart(cartDetail).then((value) => print(value));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductDeatil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      context.go("/home");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            if (!isLoading)
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 180,
                child: Image.network(
                  "$imageUrl${product.imageUrl}",
                  fit: BoxFit.fill,
                ),
              ),
            if (!isLoading)
              Expanded(
                child: Container(
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name!,
                                    style: const TextStyle(
                                      color: textColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "by Admin",
                                    style: TextStyle(
                                      color: textColor,
                                      // fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(color: textColor),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffF9AE55),
                                    ),
                                    Text(
                                      "4.7",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              product.description!,
                              style: const TextStyle(
                                color: textColor,
                                height: 1.5,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Container(
                          //     child: Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Row(
                          //       children: const [
                          //         Text(
                          //           "Color : ",
                          //           style: TextStyle(
                          //             color: textColor,
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           width: 8,
                          //         ),
                          //         CircleAvatar(
                          //           foregroundColor: Colors.blue,
                          //           radius: 8,
                          //         ),
                          //         SizedBox(
                          //           width: 4,
                          //         ),
                          //         CircleAvatar(
                          //           foregroundColor: Colors.black,
                          //           radius: 8,
                          //         ),
                          //         SizedBox(
                          //           width: 4,
                          //         ),
                          //         CircleAvatar(
                          //           foregroundColor: Colors.orange,
                          //           radius: 8,
                          //         ),
                          //         SizedBox(
                          //           width: 4,
                          //         )
                          //       ],
                          //     ),
                          //     Container(
                          //       padding: const EdgeInsets.symmetric(
                          //           horizontal: 4, vertical: 4),
                          //       decoration: BoxDecoration(
                          //         color: bgColor,
                          //         borderRadius: BorderRadius.circular(20),
                          //       ),
                          //       child: Row(
                          //         children: [
                          //           InkWell(
                          //               onTap: () {
                          //                 if (quantity <= 0) {
                          //                   return;
                          //                 } else {
                          //                   quantity--;
                          //                   setState(() {});
                          //                 }
                          //               },
                          //               child: const Icon(
                          //                 Icons.remove,
                          //                 color: darkbgColor,
                          //                 size: 15,
                          //               )),
                          //           const SizedBox(
                          //             width: 8,
                          //           ),
                          //           Text(
                          //             quantity.toString(),
                          //             style:
                          //                 const TextStyle(color: darkbgColor),
                          //           ),
                          //           const SizedBox(
                          //             width: 8,
                          //           ),
                          //           InkWell(
                          //               onTap: () {
                          //                 quantity++;
                          //                 setState(() {});
                          //               },
                          //               child: const Icon(
                          //                 Icons.add,
                          //                 size: 15,
                          //                 color: darkbgColor,
                          //               )),
                          //         ],
                          //       ),
                          //     )
                          //   ],
                          // )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            if (isLoading)
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: isLoading,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  height: 180,
                  child: Container(),
                ),
              ),
            if (isLoading)
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: isLoading,
                child: Card(
                  margin: EdgeInsets.zero,
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: textColor),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      )),
      bottomNavigationBar: Card(
        margin: EdgeInsets.zero,
        elevation: 10,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          decoration: const BoxDecoration(color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isLoading == false ? "₹${quantity * product.unitPrice!}" : "",
                style: const TextStyle(
                    color: darkbgColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                  onPressed: () {
                    addToCart();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: bgColor2,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
