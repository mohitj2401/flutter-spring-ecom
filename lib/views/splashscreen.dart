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
    SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.setString("TOKEN", '');
    var token = pref.getString("TOKEN");
    if (token == null || token == '') {
      context.go('/login');
    } else {
      context.go('/home');
    }
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
