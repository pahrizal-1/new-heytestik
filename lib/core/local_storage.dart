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
  Future<void> setUsername({required String username}) async {
    SharedPreferences prefs = await getPrefs();
    prefs.setString('username', username);
  }

  Future<String> getUsername() async {
    SharedPreferences prefs = await getPrefs();
    return prefs.getString('username') ?? '-';
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
}
