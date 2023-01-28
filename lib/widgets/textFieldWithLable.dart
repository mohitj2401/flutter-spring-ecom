import 'package:flutter/material.dart';

Widget getTextFieldWithLable({
  required TextEditingController textEditingController,
  required String lable,
  required String hintText,
  required String? Function(String?) onValidate,
  bool isObsecure = false,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "$lable ",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const TextSpan(
                text: " *",
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      TextFormField(
        controller: textEditingController,
        style: const TextStyle(color: Colors.white),
        validator: onValidate,
        obscureText: isObsecure,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      )
    ],
  );
}
