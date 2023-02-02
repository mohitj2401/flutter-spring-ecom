import 'package:dio/dio.dart';
import 'package:ecom_spring/constants/variables.dart';
import 'package:ecom_spring/models/cart-detail.dart';
import 'package:ecom_spring/models/cart.dart';
import 'package:ecom_spring/models/response.dart';
import 'package:ecom_spring/services/alert.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingService {
  String shoppingCart = 'cart';
  String deleteItemCartUrl = 'cart/delete-cart-item/';
  Future<ResponseModel> getCart() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString("TOKEN");
      // print(token);
      if (token != null) {
        Options options = Options(headers: {
          "Content-Type": "application/json",
          "X-Requested-With": "XMLHttpRequest",
          'Authorization': 'Bearer $token',
        });
        Dio dio = Dio();
        Response res = await dio.get(baseUrl + shoppingCart, options: options);
        print(res);
        if (res.statusCode == 200) {
          Cart cart = Cart.fromMap(res.data);
          return ResponseModel(
              message: "Successfully Fetched", output: cart, statusCode: 200);
        }
      }
      return ResponseModel(message: "", output: null, statusCode: 400);
    } on DioError catch (er) {
      if (er.response!.statusCode == 422) {
        if (er.response!.data["message"].toString().contains("Username")) {
          Alert.errorMessage("Username Already registered");
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
      return ResponseModel(message: "", output: null, statusCode: 400);
    } catch (e) {
      print(e.toString());
      EasyLoading.dismiss();
      return ResponseModel(message: "", output: null, statusCode: 400);
    }
  }

  Future<ResponseModel> addToCart(CartDetail cartDetail,
      {String type = ''}) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString("TOKEN");
      // print(token);
      if (token != null) {
        Options options = Options(headers: {
          "Content-Type": "application/json",
          "X-Requested-With": "XMLHttpRequest",
          'Authorization': 'Bearer $token',
        });
        Dio dio = Dio();
        Response res = await dio.post(baseUrl + shoppingCart,
            options: options, data: cartDetail.toMap());
        // print(res.data);
        if (res.statusCode == 200) {
          if (type == '') {
            Alert.successMessage("Product added to cart");
          }
        }
      }
      return ResponseModel(message: "", output: null, statusCode: 200);
    } on DioError catch (er) {
      if (er.response!.statusCode == 422) {
        if (er.response!.data["message"].toString().contains("Username")) {
          Alert.errorMessage("Username Already registered");
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
      return ResponseModel(message: "", output: null, statusCode: 400);
    } catch (e) {
      print(e.toString());
      EasyLoading.dismiss();
      return ResponseModel(message: "", output: null, statusCode: 400);
    }
  }

  Future<ResponseModel> deleteitemFromCart(CartDetail cartDetail) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString("TOKEN");
      // print(token);
      if (token != null) {
        Options options = Options(headers: {
          "Content-Type": "application/json",
          "X-Requested-With": "XMLHttpRequest",
          'Authorization': 'Bearer $token',
        });
        Dio dio = Dio();
        Response res = await dio.post(
            baseUrl + deleteItemCartUrl + cartDetail.id.toString(),
            options: options);
        print(res);
        if (res.statusCode == 200) {
          return ResponseModel(
              message: "Successfully Fetched", output: null, statusCode: 200);
        }
      }
      return ResponseModel(message: "", output: null, statusCode: 400);
    } on DioError catch (er) {
      if (er.response!.statusCode == 422) {
        if (er.response!.data["message"].toString().contains("Username")) {
          Alert.errorMessage("Username Already registered");
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
      return ResponseModel(message: "", output: null, statusCode: 400);
    } catch (e) {
      print(e.toString());
      EasyLoading.dismiss();
      return ResponseModel(message: "", output: null, statusCode: 400);
    }
  }
}
