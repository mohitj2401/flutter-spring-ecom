import 'package:ecom_spring/services/alert.dart';
import 'package:ecom_spring/services/auth.dart';
import 'package:ecom_spring/widgets/textFieldWithLable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  var formKey = GlobalKey<FormState>();

  login() {
    if (formKey.currentState!.validate()) {
      AuthService _auth = AuthService();
      _auth.login(password.text, username.text).then((value) {
        if (value) {
          context.go('/home');
          Alert.successLogin();
        } else {
          Alert.errorMessage("Username or Password is incorrect");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0A0A),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: const Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getTextFieldWithLable(
                      textEditingController: username,
                      lable: "Username",
                      hintText: "username",
                      onValidate: (value) {
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    getTextFieldWithLable(
                      textEditingController: password,
                      lable: "Password",
                      hintText: "Enter Password",
                      isObsecure: true,
                      onValidate: (value) {
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    login();
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account ? ",
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.6),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.go('/register');
                    },
                    child: const Text(
                      " Sign Up",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
