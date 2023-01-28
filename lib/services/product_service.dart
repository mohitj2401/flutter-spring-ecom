import 'package:dio/dio.dart';
import 'package:ecom_spring/constants/variables.dart';
import 'package:ecom_spring/models/product.dart';
import 'package:ecom_spring/models/response.dart';
import 'package:ecom_spring/services/Alert.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProductService {
  String productFetch = baseUrl + 'products/search/ww';

  Future<ResponseModel> get() async {
    try {
      EasyLoading.show(status: "Loading..");
      Dio dio = Dio();
      Response response = await dio.get(productFetch);
      EasyLoading.dismiss();
      if (response.statusCode == 200) {
        List<Product> product = [];
        if (response.data['content'] == null ||
            response.data['content'].isEmpty) {
        } else {
          response.data['content'].forEach((ele) {
            product.add(new Product.fromJson(ele));
          });
        }
        // Alert.successLogin();
        return ResponseModel(
            message: 'No Output', output: product, statusCode: 200);
      } else {
        Alert.error();
      }
      return ResponseModel(message: 'No Output', output: null, statusCode: 200);
    } on DioError catch (er) {
      return ResponseModel(message: 'No Output', output: null, statusCode: 200);
    } catch (e) {
      return ResponseModel(message: 'No Output', output: null, statusCode: 200);
    }
  }
}
