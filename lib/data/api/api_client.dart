import 'dart:convert' show utf8, base64;

import 'package:dio/dio.dart';
import 'package:winkels_customer/data/models/Vendor.dart';
import 'package:winkels_customer/data/models/VendorCategory.dart';
import 'package:winkels_customer/data/models/BaseProduct.dart';
import 'package:winkels_customer/data/models/VendorProduct.dart';

class ApiClient {
  // static const String BASE_URL = "http://10.0.2.2:1337";

  static const String BASE_URL = "https://winkels-strapi.herokuapp.com/"; // Testing Heroku
  // static const String BASE_URL = "https://winkels-strapi.herokuapp.com/"; // Prod
  final Dio _dio;

  ApiClient(this._dio); // Local

  Future<List<Vendor>> getVendors(String cityCode) async {
    Response response = await _dio.get(BASE_URL + "/vendors");
    print(response);
    final json = response.data as List;
    return json.map((e) => Vendor.fromJson(e)).toList();
  }

  Future<List<VendorCategory>> getCategories() async {
    Response response = await _dio.get(BASE_URL + "/vendor-categories");
    print(response);
    final json = response.data as List;
    return json.map((e) => VendorCategory.fromJson(e)).toList();
  }

  Future<List<VendorProduct>> getProducts(int vendorId) async {
    Response response = await _dio.get(BASE_URL + "/product-vendors?_where[vendor]=$vendorId");
    print(response);
    final json = response.data as List;
    return json.map((e) => VendorProduct.fromJson(e)).toList();
  }

  Future<String> registerUser(String phoneNumber) async {
    try {
      final response = await _dio.post(BASE_URL + "/auth/local/register", data: {
        'username': '$phoneNumber',
        'email': 'user_${phoneNumber.substring(1)}@winkels.com',
        'password': utf8.fuse(base64).encode(phoneNumber),
      });

      if (response.statusCode == 200) {
        return response.data['jwt'].toString();
      }
      if (response.statusCode == 400) {
        return loginUser(phoneNumber);
      }
      return null;
    } catch (e) {
      if (e is DioError) {
        return loginUser(phoneNumber);
      } else {
        return null;
      }
    }
  }

  Future<String> loginUser(String phoneNumber) async {
    final response = await _dio.post(BASE_URL + "/auth/local", data: {
      'identifier': '$phoneNumber',
      'password': utf8.fuse(base64).encode(phoneNumber),
    });

    if (response.statusCode == 200) {
      return response.data['jwt'].toString();
    }
    return null;
  }
}
