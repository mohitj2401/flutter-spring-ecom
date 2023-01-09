import 'package:dio/dio.dart';
import 'package:ecom_spring/constants/variables.dart';
import 'package:ecom_spring/services/Alert.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AuthService {
  String loginUrl = baseUrl + '/auth/signin';
  String signupUrl = baseUrl + '/auth/signin';
  String profile = baseUrl + '/auth/user';

  login() async {
    EasyLoading.show(status: "Loading..");
    Dio dio = Dio();
    Response response = await dio.post(loginUrl);
    EasyLoading.dismiss();
    if (response.statusCode == 200) {
      Alert.successLogin();
    } else {
      Alert.error();
    }
  }

  signup() async {
    EasyLoading.show(status: "Loading..");
    Dio dio = Dio();
    Response response = await dio.post(signupUrl);
    EasyLoading.dismiss();

    if (response.statusCode == 200) {
      Alert.successLogin();
    } else {
      Alert.error();
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
