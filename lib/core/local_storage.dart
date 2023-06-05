import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<SharedPreferences> getPrefs() async => SharedPreferences.getInstance();

  Future<void> setAccessToken({required String token}) async {
    SharedPreferences prefs = await getPrefs();
    prefs.setString("jwtToken", token);
  }

  Future<void> setRefreshToken({required String token}) async {
    SharedPreferences prefs = await getPrefs();
    prefs.setString("refresh_token", token);
  }

  Future<void> setUserID({required int userID}) async {
    SharedPreferences prefs = await getPrefs();
    prefs.setInt("user_id", userID);
  }

  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await getPrefs();
    return prefs.getString("jwtToken") ?? "";
  }

  Future<String> getRefreshToken() async {
    SharedPreferences prefs = await getPrefs();
    return prefs.getString("refresh_token") ?? "";
  }

  Future<int?> getUserID() async {
    SharedPreferences prefs = await getPrefs();
    return prefs.getInt("user_id") ;
  }
}
