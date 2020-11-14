import 'package:firebase_auth/firebase_auth.dart';
import 'package:winkels_customer/data/api/api_client.dart';
import 'package:winkels_customer/data/models/base_product.dart';
import 'package:winkels_customer/data/preferences/preferences.dart';

class Repository {
  final ApiClient _apiClient;
  final Preferences _preferences;

  bool userPhoneVerified = false;
  String verificationId = '';

  Repository(this._apiClient, this._preferences);

  Future<List<BaseProduct>> getProducts(String vendorId) async {
    return _apiClient.getProducts(vendorId);
  }

  Future<bool> authenticateUser(String phoneNumber, String smsCode) async {
    if (userPhoneVerified) return true;

    try {
      FirebaseAuth _auth = FirebaseAuth.instance;
      AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

      final result = await _auth.signInWithCredential(credential);
      if (result.user != null) {
        return _apiClient.registerUser(phoneNumber);
      }
      return false;
    } catch (e) {
      return false;
    }
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
    _preferences.saveSession();
  }
}
