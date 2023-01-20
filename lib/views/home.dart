import 'package:ecom_spring/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List category = ["All", "Books", "Phones", "Badges"];
  bool isLoading = false;
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      initialIndex: 1,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Home",
        labels: const ["Home", "Cart", "Favirote", "Profile"],
        icons: const [Icons.home, Icons.shopping_bag, Icons.star, Icons.person],
        tabSize: 50,
        tabBarHeight: 60,
        textStyle: const TextStyle(
          fontSize: 15,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
        tabIconColor: textColor,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: bgColor2,
        tabIconSelectedColor: Colors.white,
        tabBarColor: Colors.white,
        onTabItemSelected: (int value) {
          setState(() {
            _tabController.index = value;
          });
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            // width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Best Products",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Perfect Choice!",
                  // textAlign: TextAlign.start,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search..",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: textColor,
                        ),
                      ),
                    )),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.do_not_touch))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: index != 0 ? bgColor : darkbgColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        elevation: index != 0 ? 0 : 10,
                        child: Padding(
                          // decoration: BoxDecoration(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          child: Text(
                            category[index],
                            style: TextStyle(
                              color: index == 0 ? Colors.white : textColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (isLoading)
                  Expanded(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      enabled: isLoading,
                      child: ListView.builder(
                        itemBuilder: (_, __) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Card(
                            color: Colors.white,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Container(
                              //  width: 500,
                              height: 150,
                            ),
                          ),
                        ),
                        itemCount: 3,
                      ),
                    ),
                  ),
                if (!isLoading)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          context.go('/home/products/1');
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Card(
                            color: Colors.white,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              //  width: 500,
                              height: 180,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
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
                                      child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
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
                                        const Text(
                                          "by Admin",
                                          style: TextStyle(
                                            color: textColor,
                                            // fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        const Text(
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              height: 1.5,
                                              color: textColor,
                                              fontWeight: FontWeight.w500),
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
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  backgroundColor: darkbgColor,
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 10)),
                                              onPressed: () {},
                                              child: const Text("Buy"),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 5,
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
