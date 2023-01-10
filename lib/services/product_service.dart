import 'package:dio/dio.dart';
import 'package:ecom_spring/constants/variables.dart';
import 'package:ecom_spring/services/Alert.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProductService {
  String loginUrl = baseUrl + '/products';
  String signupUrl = baseUrl + '/auth/signin';
  String profile = baseUrl + '/auth/user';

  get() async {
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
}
