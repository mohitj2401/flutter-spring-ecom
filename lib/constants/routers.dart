import 'package:ecom_spring/models/cart.dart';
import 'package:ecom_spring/models/purchase.dart';
import 'package:ecom_spring/views/cart.dart';
import 'package:ecom_spring/views/checkout.dart';
import 'package:ecom_spring/views/home.dart';
import 'package:ecom_spring/views/login.dart';
import 'package:ecom_spring/views/payment.dart';
import 'package:ecom_spring/views/product_detail.dart';
import 'package:ecom_spring/views/profile.dart';
import 'package:ecom_spring/views/register.dart';
import 'package:ecom_spring/views/splashscreen.dart';
import 'package:ecom_spring/views/success.dart';
import 'package:go_router/go_router.dart';

final GoRouter routers = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
      // routes: retailersRoute,
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
      // routes: retailersRoute,
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
      // routes: retailersRoute,
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
      routes: authRoutes,
    ),
  ],
);
final authRoutes = [
  GoRoute(
    path: 'products/:pid',
    builder: (context, state) => ProductDetailScreen(
      productId: state.params['pid']!,
    ),
  ),
  GoRoute(path: 'profile', builder: (context, state) => const ProfileScreen()),
  GoRoute(
    path: 'cart',
    builder: (context, state) => const CartDetailScreen(),
    routes: [
      GoRoute(
        path: 'checkout',
        builder: (context, state) {
          Cart cart = state.extra as Cart;

          return CheckoutScreen(
            cart: cart,
          );
        },
      ),
      GoRoute(
        path: 'payment',
        builder: (context, state) {
          Purchase purchase = state.extra as Purchase;
          return PaymentScreen(
            purchase: purchase,
          );
        },
      )
    ],
  ),
  GoRoute(
    path: 'success',
    builder: (context, state) {
      String orderId = state.extra as String;

      return PurchaseSuccess(
        orderId: orderId,
      );
    },
  ),
];
