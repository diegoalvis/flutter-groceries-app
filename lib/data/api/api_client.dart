import 'package:dio/dio.dart';
import 'package:winkels_customer/data/models/base_product.dart';
import 'package:winkels_customer/data/models/product.dart';

class ApiClient {
  //static const String BASE_URL = "http://localhost:1337"; // Testing
  static const String BASE_URL = "http://localhost:1337";

  final Dio _dio;

  ApiClient(this._dio); // Local

  Future<List<BaseProduct>> getProducts(String vendorId) async {
    Response response = await Dio().get(BASE_URL + "/products");
    print(response);
    final productsJson = response.data as List;
    final productList = productsJson.map((e) => BaseProduct.fromJson(e)).toList();
    return productList;
  }
}
