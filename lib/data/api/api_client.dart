import 'dart:convert' show utf8, base64;

import 'package:dio/dio.dart';
import 'package:winkels_customer/data/models/base_product.dart';

class ApiClient {
  static const String BASE_URL = "http://10.0.2.2:1337";

  // static const String BASE_URL = "https://winkels-strapi.herokuapp.com/"; // Testing Heroku
  // static const String BASE_URL = "https://winkels-strapi.herokuapp.com/"; // Prod
  final Dio _dio;

  ApiClient(this._dio); // Local

  Future<List<BaseProduct>> getProducts(String vendorId) async {
    Response response = await _dio.get(BASE_URL + "/products");
    print(response);
    final productsJson = response.data as List;
    final productList = productsJson.map((e) => BaseProduct.fromJson(e)).toList();
    return productList;
  }

  Future<bool> registerUser(String phoneNumber) async {
    try {
      final response = await _dio.post(BASE_URL + "/auth/local/register", data: {
        'username': '$phoneNumber',
        'email': 'user_${phoneNumber.substring(1)}@winkels.com',
        'password': utf8.fuse(base64).encode(phoneNumber),
      });

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      if (e is DioError) {
        return loginUser(phoneNumber);
      } else {
        return false;
      }
    }
  }

  Future<bool> loginUser(String phoneNumber) async {
    final response = await _dio.post(BASE_URL + "/auth/local", data: {
      'identifier': '$phoneNumber',
      'password': utf8.fuse(base64).encode(phoneNumber),
    });

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
