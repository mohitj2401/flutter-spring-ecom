import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:ecom_spring/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<TabItem> items = [
  const TabItem(
    icon: Icons.home,
    title: 'Home',
  ),
  const TabItem(
    icon: Icons.shopping_cart_outlined,
    title: 'Cart',
  ),
  const TabItem(
    icon: Icons.account_box,
    title: 'profile',
  ),
];

Widget getBottomNavigationBar(BuildContext context, int visit) {
  return BottomBarInspiredInside(
    items: items,
    backgroundColor: Colors.white,
    color: textColor,
    colorSelected: Colors.white,
    indexSelected: visit,
    onTap: (int index) {
      // visit = index;
      if (index == 1) {
        context.go('/home/cart');
      }
      if (index == 0) {
        context.go('/home');
      }
      if (index == 2) {
        context.go('/home/profile');
      }
      // visit = 1;
    },
    chipStyle: const ChipStyle(convexBridge: true, background: bgColor2),
    itemStyle: ItemStyle.circle,
    animated: true,
  );
}
