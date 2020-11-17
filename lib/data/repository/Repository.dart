import 'package:firebase_auth/firebase_auth.dart';
import 'package:winkels_customer/data/api/api_client.dart';
import 'package:winkels_customer/data/models/Address.dart';
import 'package:winkels_customer/data/models/Vendor.dart';
import 'package:winkels_customer/data/models/VendorCategory.dart';
import 'package:winkels_customer/data/models/BaseProduct.dart';
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

  Future<bool> registerUser(String phoneNumber) async {
    final token = await _apiClient.registerUser(phoneNumber);
    if (token != null && token.isNotEmpty) {
      return _preferences.saveAuthToken(token);
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
}
