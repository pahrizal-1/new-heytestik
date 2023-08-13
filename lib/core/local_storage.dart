import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<SharedPreferences> getPrefs() async => SharedPreferences.getInstance();

  // TOKEN
  Future<void> setAccessToken({required String token}) async {
    SharedPreferences prefs = await getPrefs();
    prefs.setString('jwtToken', token);
  }

  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await getPrefs();
    return prefs.getString('jwtToken') ?? '-';
  }

  Future removeAccessToken() async {
    SharedPreferences prefs = await getPrefs();
    prefs.remove('jwtToken');
  }

  // REFRESH TOKEN
  // Future<void> setRefreshToken({required String token}) async {
  //   SharedPreferences prefs = await getPrefs();
  //   prefs.setString('refresh_token', token);
  // }

  // Future<String> getRefreshToken() async {
  //   SharedPreferences prefs = await getPrefs();
  //   return prefs.getString('refresh_token') ?? '-';
  // }

  // USER ID
  Future<void> setUserID({required int userID}) async {
    SharedPreferences prefs = await getPrefs();
    prefs.setInt('user_id', userID);
  }

  Future<int?> getUserID() async {
    SharedPreferences prefs = await getPrefs();
    return prefs.getInt('user_id');
  }

  // USERNAME
  Future<void> setFullName({required String fullName}) async {
    SharedPreferences prefs = await getPrefs();
    prefs.setString('full_name', fullName);
  }

  Future<String> getFullName() async {
    SharedPreferences prefs = await getPrefs();
    return prefs.getString('full_name') ?? '-';
  }

  // ROLE
  Future<void> setRoleID({required int roleID}) async {
    SharedPreferences prefs = await getPrefs();
    prefs.setInt('role_id', roleID);
  }

  Future<int?> getRoleID() async {
    SharedPreferences prefs = await getPrefs();
    return prefs.getInt('role_id');
  }

  // DATA USER
  Future<void> setDataUser({required dynamic dataUser}) async {
    SharedPreferences prefs = await getPrefs();
    prefs.setString('data_user', jsonEncode(dataUser));
  }

  Future<void> setUsername({required String username}) async {
    SharedPreferences prefs = await getPrefs();
    prefs.setString('username', username);
  }

  Future<String> getUsername() async {
    SharedPreferences prefs = await getPrefs();
    return prefs.getString('username') ?? "";
  }

  Future<dynamic> getDataUser() async {
    SharedPreferences prefs = await getPrefs();
    var data = prefs.getString('data_user')?.trim() ?? '';
    print("data 123 $data");
    if (data.isEmpty) {
      return '';
    }

    var result = jsonDecode(data);
    print("result 123 ${result['fullname']}");
    print("result 123 $result");
    return result;
  }

  // LOCATION
  Future<void> setLocation({required dynamic location}) async {
    SharedPreferences prefs = await getPrefs();
    prefs.setString('location', jsonEncode(location));
  }

  Future<dynamic> getLocation() async {
    SharedPreferences prefs = await getPrefs();
    var data = prefs.getString('location')?.trim() ?? '';

    if (data.isEmpty) {
      return '';
    }
    var result = jsonDecode(data);
    return result;
  }
}
