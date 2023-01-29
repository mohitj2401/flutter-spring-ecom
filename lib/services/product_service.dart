import 'package:dio/dio.dart';
import 'package:ecom_spring/constants/variables.dart';
import 'package:ecom_spring/models/product.dart';
import 'package:ecom_spring/models/response.dart';
import 'package:ecom_spring/services/Alert.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProductService {
  String productSearch = baseUrl + 'products/search/';
  String productFetch = baseUrl + 'products';
  String categoryProducts = baseUrl + 'products/category/';

  Future<ResponseModel> get() async {
    try {
      // EasyLoading.show(status: "Loading..");
      Dio dio = Dio();
      Response response = await dio.get(productFetch);
      // EasyLoading.dismiss();
      // print(response);
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
      print(e.toString());
      return ResponseModel(message: 'No Output', output: null, statusCode: 200);
    }
  }

  Future<ResponseModel> getProductByCategory(int id) async {
    try {
      // EasyLoading.show(status: "Loading..");
      Dio dio = Dio();
      Response response = await dio.get(categoryProducts + id.toString());
      // EasyLoading.dismiss();
      // print(response);
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
      print(e.toString());
      return ResponseModel(message: 'No Output', output: null, statusCode: 200);
    }
  }

  Future<ResponseModel> searchProduct(String query) async {
    try {
      // EasyLoading.show(status: "Loading..");
      Dio dio = Dio();
      Response response = await dio.get(productSearch + query);
      // EasyLoading.dismiss();
      // print(response);
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
      print(e.toString());
      return ResponseModel(message: 'No Output', output: null, statusCode: 200);
    }
  }
}
