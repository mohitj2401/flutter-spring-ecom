import 'package:ecom_spring/views/cart.dart';
import 'package:ecom_spring/views/home.dart';
import 'package:ecom_spring/views/login.dart';
import 'package:ecom_spring/views/product_detail.dart';
import 'package:ecom_spring/views/profile.dart';
import 'package:ecom_spring/views/register.dart';
import 'package:go_router/go_router.dart';

final GoRouter routers = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
      // routes: retailersRoute,
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
      // routes: retailersRoute,
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterScreen(),
      // routes: retailersRoute,
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(),
      routes: authRoutes,
    ),
  ],
);
final authRoutes = [
  GoRoute(
    path: 'products/:pid',
    builder: (context, state) => ProductDetailScreen(),
  ),
  GoRoute(path: 'profile', builder: (context, state) => ProfileScreen()),
  GoRoute(path: 'cart', builder: (context, state) => CartDetailScreen()),
];
