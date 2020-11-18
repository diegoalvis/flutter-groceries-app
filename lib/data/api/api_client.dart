import 'dart:convert' show base64, json, utf8;

import 'package:dio/dio.dart';
import 'package:winkels_customer/core/payment/payment_helper.dart';
import 'package:winkels_customer/data/models/Order.dart';
import 'package:winkels_customer/data/models/OrderDTO.dart';
import 'package:winkels_customer/data/models/Vendor.dart';
import 'package:winkels_customer/data/models/VendorCategory.dart';
import 'package:winkels_customer/data/models/VendorProduct.dart';

class ApiClient {
  static const String BASE_URL = "http://10.0.2.2:1337";

  // Testing Heroku
  // static const String BASE_URL = "https://winkels-strapi.herokuapp.com";
  // Prod
  // static const String BASE_URL = "https://winkels-strapi.herokuapp.com";
  final Dio _dio;

  ApiClient(this._dio); // Local

  Future<List<Vendor>> getVendors(String cityCode) async {
    Response response = await _dio.get(BASE_URL + "/vendors?_where[city_code]=$cityCode");
    print(response);
    final json = response.data as List;
    return json.map((e) => Vendor.fromJson(e)).toList();
  }

  Future getSession() async {
    Response response = await _dio.get(BASE_URL + "/users/me");
    print(response);
    Map<String, dynamic> user = response.data;
    return user['id'];
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

  Future<dynamic> registerUser(String phoneNumber) async {
    try {
      final response = await _dio.post(BASE_URL + "/auth/local/register", data: {
        'username': '$phoneNumber',
        'email': 'user_${phoneNumber.substring(1)}@winkels.com',
        'password': utf8.fuse(base64).encode(phoneNumber),
      });

      if (response.statusCode == 200) {
        return response.data;
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

  Future<dynamic> loginUser(String phoneNumber) async {
    final response = await _dio.post(BASE_URL + "/auth/local", data: {
      'identifier': '$phoneNumber',
      'password': utf8.fuse(base64).encode(phoneNumber),
    });

    if (response.statusCode == 200) {
      return response.data;
    }
    return null;
  }

  Future<Order> createOrder(OrderDTO order) async {
    Response response = await _dio.post(BASE_URL + "/orders", data: order.toJson());
    print(response);
    return Order.fromJson(response.data);
  }

  Future<Order> updateOrder(OrderDTO order) async {
    Response response = await _dio.put(BASE_URL + "/orders/${order.id}", data: order.toJson());
    print(response);
    return Order.fromJson(response.data);
  }

  Future<String> createMercadoPagoPreference(Map<String, Object> preference) async {
    Response response =
        await _dio.post('https://api.mercadopago.com/checkout/preferences?access_token=${PaymentHelper.ACCESS_TOKEN}', data: json.encode(preference));
    Map<String, dynamic> prefResponse = response.data;
    return prefResponse['id'];
  }

  Future<List<Order>> getMyOrders(int userId) async {
    Response response = await _dio.get(BASE_URL + "/orders?_where[users_permissions_user]=$userId");
    print(response);
    final json = response.data as List;
    return json.map((e) => Order.fromJson(e)).toList();
  }
}
