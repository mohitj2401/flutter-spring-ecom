import 'package:ecom_spring/constants/routers.dart';
import 'package:ecom_spring/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  getTOken() async {
    AuthService _authService = AuthService();
    _authService.user(context).then((value) {
      if (value) {
        context.go('/home');
      } else {
        context.go('/login');
      }
    });
  }

  @override
  void initState() {
    getTOken();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
