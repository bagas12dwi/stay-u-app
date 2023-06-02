import 'dart:convert';

import 'package:get/get.dart';
import 'package:stay_u_app/helpers/api.dart';
import 'package:stay_u_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  Future<User> getDetailUser(int id) async {
    final response = await http.get(Uri.parse(Api.baseUrl + "/getDetailAkun/${id}"));
    if(response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      if(responseData != null) {
        return User.fromJson(responseData['data']);
      } else {
        throw Exception('invalid data parse');
      }
    } else {
      throw Exception('failed');
    }
  }
}