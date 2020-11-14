import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:winkels_customer/data/models/Address.dart';
import 'package:winkels_customer/data/models/Profile.dart';

class Preferences {
  SharedPreferences _preferences;

  static const SELECTED_ADDRESS = 'selectedAddress';
  static const PROFILE = 'profile';
  static const ADDRESS = 'address';
  static const USER_LOGGED_IN = "user_logged_in";
  static const AUTH_TOKEN = "auth_token";

  Future<Preferences> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> saveProfile(Profile profile) async {
    if (profile == null) {
      return await _preferences.setString(PROFILE, null);
    } else {
      return await _preferences.setString(PROFILE, json.encode(profile.toJson()));
    }
  }

  Profile getProfile() {
    final profileJson = _preferences.getString(PROFILE);
    try {
      return Profile.fromJson(json.decode(profileJson));
    } catch (e) {
      return null;
    }
  }

  Future<bool> loginUser() async {
    return _preferences.setBool(USER_LOGGED_IN, true);
  }

  bool getSession() {
    try {
      return _preferences.getBool(USER_LOGGED_IN);
    } catch (e) {
      return false;
    }
  }

  Future<bool> saveAuthToken(String token) async {
    return _preferences.setString(AUTH_TOKEN, token);
  }

  String getAuthToken() {
    try {
      return _preferences.getString(AUTH_TOKEN);
    } catch (e) {
      return null;
    }
  }

  Future<void> clearSession() async {
    await _preferences.setBool(USER_LOGGED_IN, false);
  }

  Future<bool> saveUserAddress(Address address) async {
    if (address == null) {
      return await _preferences.setString(ADDRESS, null);
    } else {
      return await _preferences.setString(ADDRESS, json.encode(address.toJson()));
    }
  }

  Address getAddress() {
    final addressJson = _preferences.getString(ADDRESS);
    try {
      return Address.fromJson(json.decode(addressJson));
    } catch (e) {
      return null;
    }
  }
}
