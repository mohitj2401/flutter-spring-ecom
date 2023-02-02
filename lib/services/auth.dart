import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecom_spring/constants/variables.dart';
import 'package:ecom_spring/services/Alert.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String loginUrl = baseUrl + 'auth/signin';
  String signupUrl = baseUrl + 'auth/signup';
  String profile = baseUrl + 'auth/user';
  late SharedPreferences pref;

  Future<bool> login(password, username) async {
    pref = await SharedPreferences.getInstance();

    try {
      EasyLoading.show(status: "Loading..");
      Dio dio = Dio();
      var body = {
        "username": username,
        "password": password,
      };

      Response response = await dio.post(
        loginUrl,
        data: jsonEncode(body),
        options: Options(headers: {"Content-Type": "application/json"}),
      );
      EasyLoading.dismiss();
      if (response.statusCode == 200) {
        pref.setString("TOKEN", response.data['token']);

        return true;
      } else {
        Alert.error();
      }
      return false;
    } catch (e) {
      // print(e);
      EasyLoading.dismiss();
      return false;
    }
  }

  signup(username, name, password, email) async {
    try {
      EasyLoading.show(status: "Loading..");
      Dio dio = Dio();
      Response response = await dio.post(
        signupUrl,
        data: {
          "username": username,
          "name": name,
          "password": password,
          "email": email
        },
        options: Options(headers: {"Content-Type": "application/json"}),
      );
      EasyLoading.dismiss();

      if (response.statusCode == 200) {
        pref.setString("TOKEN", response.data['token']);
        Alert.successMessage("Register Successfully");
        return true;
      } else {
        Alert.error();
      }
    } on DioError catch (er) {
      if (er.response!.statusCode == 422) {
        if (er.response!.data["message"].toString().contains("Username")) {
          Alert.errorMessage("Username Already registered");
          return false;
        }
        if (er.response!.data["message"].toString().contains("Email")) {
          Alert.errorMessage("Email Already registered");
        } else {
          Alert.errorMessage("Something Went Wrong");
        }
      } else {
        Alert.errorMessage("Something Went Wrong");
      }
      EasyLoading.dismiss();
      return false;
    } catch (e) {
      print(e.toString());
      EasyLoading.dismiss();
      return false;
    }
  }

  user() async {
    EasyLoading.show(status: "Loading..");
    Dio dio = Dio();
    Response response = await dio.post(profile);
    EasyLoading.dismiss();

    if (response.statusCode == 200) {
      Alert.successLogin();
    } else {
      Alert.error();
    }
  }
}
