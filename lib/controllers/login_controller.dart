import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stay_u_app/helpers/api.dart';
import 'package:stay_u_app/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:stay_u_app/providers/user_provider.dart';
import 'package:stay_u_app/view/screens/home/home.dart';
import 'package:stay_u_app/view/screens/login/login.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController namaController;
  var status_code;
  var user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    namaController = TextEditingController();
  }

  void login() async {
    try {
      var user = User(email: emailController.text, password: passwordController.text);
      var response = await http.post(Uri.parse(Api.baseUrl + '/login'),
          body: json.encode(user.toJson()),
          headers: {'Content-type':'application/json'}
      );
      if (response.statusCode == 200){
        var responseData = json.decode(response.body);
        status_code = responseData['status_code'];
        if(status_code == 200){
          return Get.offAll( () => Home(id: responseData['data']['id'],) );
        } else {
          return status_code;
        }
      }

    } catch (e) {
      print(e);
    }
  }

  void register() async {
    try{
      var user = User(email: emailController.text, password: passwordController.text, nama: namaController.text);
      var response = await http.post(Uri.parse(Api.baseUrl + '/register'),
          body: json.encode(user.toJson()),
          headers: {'Content-type':'application/json'}
      );

      if(response.statusCode == 200) {
        var responseData = json.decode(response.body);
        status_code = responseData['status_code'];
        if(status_code == 200){
          return Get.offAll(() => Login());
        } else {
          return status_code;
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void getDetail(int id) async {
    try {
      var userData = await UserProvider().getDetailUser(id);
      user.value = userData;
    } catch (e) {
      print(e);
    }
  }
}