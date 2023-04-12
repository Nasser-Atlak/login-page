import 'dart:convert';

import 'package:dio/dio.dart';

import 'ihttp_helper.dart';

class HttpHelper implements IHttpHelper {
  final Dio dio;

  HttpHelper(this.dio);

  @override
  Future<String?> login(String username, String password) async {
    var params = {"email": username, "password": password};
    Response response = await dio.post(
      "/api/login",
      data: params,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.data.toString());

      if (data != null) {
        return data["token"];
      } else {
        throw Exception('Data is NULL');
      }
    } else {
      throw Exception("Error : ${response.statusCode}");
    }
  }
}
