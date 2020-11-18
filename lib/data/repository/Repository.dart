import 'package:firebase_auth/firebase_auth.dart';
import 'package:winkels_customer/data/api/api_client.dart';
import 'package:winkels_customer/data/models/Address.dart';
import 'package:winkels_customer/data/models/Order.dart';
import 'package:winkels_customer/data/models/OrderDTO.dart';
import 'package:winkels_customer/data/models/Vendor.dart';
import 'package:winkels_customer/data/models/VendorCategory.dart';
import 'package:winkels_customer/data/models/VendorProduct.dart';
import 'package:winkels_customer/data/preferences/preferences.dart';

class Repository {
  final ApiClient _apiClient;
  final Preferences _preferences;

  bool userPhoneVerified = false;
  String verificationId = '';

  Repository(this._apiClient, this._preferences);

  Future<List<VendorProduct>> getProducts(int vendorId) async {
    return _apiClient.getProducts(vendorId);
  }

  Future<List<Vendor>> getVendors() {
    return _apiClient.getVendors(_preferences.getAddress()?.cityCode ?? '');
  }

  Future<List<VendorCategory>> getCategories() {
    return _apiClient.getCategories();
  }

  Future<bool> authenticateUser(String phoneNumber, String smsCode) async {
    if (userPhoneVerified) return registerUser(phoneNumber);

    try {
      FirebaseAuth _auth = FirebaseAuth.instance;
      AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

      final result = await _auth.signInWithCredential(credential);
      if (result.user != null) {
        _preferences.saveUserPhone(phoneNumber);
        return registerUser(phoneNumber);
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  String getUserPhone() {
    return _preferences.getUserPhone();
  }

  Future<String> createMercadoPagoPreference(Map<String, Object> preference) async {
    final res = await _apiClient.createMercadoPagoPreference(preference);
    if (res != null && res.isNotEmpty) {
      return res;
    }
    return null;
  }

  Future<bool> registerUser(String phoneNumber) async {
    final result = await _apiClient.registerUser(phoneNumber);
    if (result != null) {
      final token = result['jwt'].toString();
      final userId = result['user']['id'];
      await _preferences.saveAuthToken(token);
      await _preferences.saveUserId(userId);
      return true;
    }
    return false;
  }

  Future requestSMSCode(String phoneNumber) async {
    userPhoneVerified = false;
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 30),
        verificationCompleted: (AuthCredential authCredential) {
          _auth.signInWithCredential(authCredential).then((UserCredential credential) {
            userPhoneVerified = true;
          });
        },
        verificationFailed: (FirebaseAuthException authException) {
          print(authException.message);
        },
        codeSent: (String id, [int forceResendingToken]) {
          this.verificationId = id;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId = verificationId;
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }

  void saveUserSession() {
    _preferences.setUserLoggedIn(true);
  }

  Future<bool> saveUserAddress(Address address) {
    return _preferences.saveUserAddress(address);
  }

  Address getSavedAddress() {
    return _preferences.getAddress();
  }

  Future<bool> logout() {
    return _preferences.clearSession();
  }

  Future<Order> createOrder(OrderDTO order) async {
    final result = await _apiClient.createOrder(order);
    if (result != null) {
      await _preferences.saveLastOrderId(result.id);
      return result;
    }
    return null;
  }

  Future<bool> updateOrder(OrderDTO order) async {
    final result = await _apiClient.updateOrder(order
      ..usersPermissionsUser = _preferences.getUserId().toString()
      ..orderStatus = ORDER_STATUS_STRING[OrderStatus.PAYMENT_CONFIRMED]);
    if (result != null) {
      return true;
    }
    return false;
  }

  Future<List<Order>> getMyOrders() async {
    final result = await _apiClient.getMyOrders(_preferences.getUserId());
    if (result != null && result.isNotEmpty) {
      return result;
    }
    throw Error();
  }
}
