
import 'package:login_page/data/shared_preferences/ishared_preferences.dart';

import '../data/http/ihttp_helper.dart';

import './irepository.dart';

class Repository implements IRepository {
  final IHttpHelper _iHttpHelper;
  final ISharedPreferences _iSharedPreferences;

  Repository(this._iHttpHelper, this._iSharedPreferences);
  @override
  Future<String?> login(String username, String password) async {
    return await _iHttpHelper.login(username, password);
  }

  @override
  Future<String?> persistToken(String token) async {
    return await _iSharedPreferences.persistToken(token);
  }

  @override
  Future<String?> hasToken() async {
    return await _iSharedPreferences.hasToken();
  }

  @override
  Future<bool> deleteToken() async {
    return await _iSharedPreferences.deleteToken();
  }
}
