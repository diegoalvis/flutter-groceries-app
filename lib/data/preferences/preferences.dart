import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:winkels_customer/data/models/Profile.dart';

class Preferences {
  SharedPreferences _preferences;

  static const SELECTED_ADDRESS = 'selectedAddress';
  static const PROFILE = 'profile';
  static const USER_LOGGED_IN = "user_logged_in";

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

  Future<void> saveSession() async {
    await _preferences.setBool(USER_LOGGED_IN, true);
  }

  bool getSession() {
    try {
      return _preferences.getBool(USER_LOGGED_IN);
    } catch (e) {
      return false;
    }
  }

  Future<void> clearSession() async {
    await _preferences.setBool(USER_LOGGED_IN, false);
  }
}
