import 'package:ecom_spring/services/alert.dart';
import 'package:ecom_spring/services/auth.dart';
import 'package:ecom_spring/widgets/textFieldWithLable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();

  var formKey = GlobalKey<FormState>();
  signup() {
    if (formKey.currentState!.validate()) {
      if (password.text != passwordConfirm.text) {
        Alert.errorMessage("Password do not match!");
        return;
      }
      AuthService _auth = AuthService();
      _auth
          .signup(username.text, name.text, password.text, email.text)
          .then((value) {
        if (value) {
          context.go('/home');
          Alert.successMessage("Register Successfully");
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
                  "Get Your Free Amount",
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
                      textEditingController: name,
                      lable: "Full Name",
                      hintText: "Enter Your Name",
                      onValidate: (value) {
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    getTextFieldWithLable(
                      textEditingController: email,
                      lable: "Email Address",
                      hintText: "Enter Your Email Address",
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
                    const SizedBox(
                      height: 20,
                    ),
                    getTextFieldWithLable(
                      textEditingController: passwordConfirm,
                      lable: "Confirm Password",
                      hintText: "Enter Confirm Password",
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
                    signup();
                  },
                  child: const Text(
                    "Sign Up",
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
                    "Already have an account ",
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.6),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.go('/login');
                    },
                    child: const Text(
                      " Login",
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
