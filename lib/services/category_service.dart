import 'package:dio/dio.dart';
import 'package:ecom_spring/constants/variables.dart';
import 'package:ecom_spring/models/productCategory.dart';
import 'package:ecom_spring/models/response.dart';
import 'package:ecom_spring/services/Alert.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CategoryService {
  String category = baseUrl + 'product-category';

  Future<ResponseModel> get() async {
    try {
      EasyLoading.show(status: "Loading..");
      Dio dio = Dio();
      Response response = await dio.get(category);
      EasyLoading.dismiss();
      // print(response.data);
      if (response.statusCode == 200) {
        List<ProductCategory> categories = [];
        if (response.data == null || response.data.isEmpty) {
        } else {
          response.data.forEach((ele) {
            categories.add(ProductCategory.fromMap(ele));
          });
        }
        // Alert.successLogin();
        return ResponseModel(
            message: 'No Output', output: categories, statusCode: 200);
      } else {
        Alert.error();
      }
      return ResponseModel(message: 'No Output', output: null, statusCode: 200);
    } on DioError {
      return ResponseModel(message: 'No Output', output: null, statusCode: 200);
    } catch (e) {
      print(e.toString());
      return ResponseModel(message: 'No Output', output: null, statusCode: 200);
    }
  }
}
