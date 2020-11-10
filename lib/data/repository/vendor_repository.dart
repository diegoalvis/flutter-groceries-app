import 'package:winkels_customer/data/api/api_client.dart';
import 'package:winkels_customer/data/models/base_product.dart';

class VendorRepository {
  final ApiClient apiClient;

  VendorRepository(this.apiClient);

  Future<List<BaseProduct>> getProducts(String vendorId) async {
    return apiClient.getProducts(vendorId);
  }
}
