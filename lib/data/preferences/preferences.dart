import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:winkels_customer/data/models/Profile.dart';

class Preferences {
  SharedPreferences _preferences;

  static const SELECTED_ADDRESS = 'selectedAddress';
  static const PROFILE = 'profile';

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
}
