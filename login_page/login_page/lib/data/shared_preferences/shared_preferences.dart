import 'package:login_page/data/shared_preferences/ishared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs implements ISharedPreferences {
  @override
  Future<String?> persistToken(String token) async {
    (await getPrefs()).setString('token', token);
  }

  @override
  Future<String?> hasToken() async {
    return ((await getPrefs()).getString('token'));
  }

  @override
  Future<bool> deleteToken() async {
    return ((await getPrefs()).remove('token'));
  }

  @override
  Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }
}
