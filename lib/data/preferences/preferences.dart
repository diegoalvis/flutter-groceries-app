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
  static const USER_PHONE = "user_phone";

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

  Future<bool> setUserLoggedIn(bool loggedIn) async {
    return _preferences.setBool(USER_LOGGED_IN, loggedIn);
  }

  bool isUserLoggedIn() {
    try {
      return _preferences.getBool(USER_LOGGED_IN) ?? false;
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

  Future<bool> clearSession() async {
    await setUserLoggedIn(false);
    return _preferences.setString(AUTH_TOKEN, null);
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

  Future<bool> saveUserPhone(String phoneNumber) async {
    await setUserLoggedIn(false);
    return _preferences.setString(USER_PHONE, phoneNumber);
  }

  String getUserPhone() {
    try {
      return _preferences.getString(USER_PHONE);
    } catch (e) {
      return null;
    }
  }
}
