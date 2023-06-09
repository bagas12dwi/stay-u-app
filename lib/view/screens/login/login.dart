import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stay_u_app/controllers/login_controller.dart';
import 'package:stay_u_app/view/constant/colors.dart';
import 'package:stay_u_app/view/constant/components/rounded_button.dart';
import 'package:stay_u_app/view/constant/components/rounded_input_field.dart';
import 'package:stay_u_app/view/screens/home/home.dart';
import 'package:stay_u_app/view/screens/register/register.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final String assetName = "./assets/login.svg";
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    assetName,
                    height: 100.h,
                    width: 100.h,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Login",
                    style:
                        TextStyle(fontSize: 16.h, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  RoundedInputField(hintText: "email", controller: loginController.emailController,),
                  RoundedPasswordField(controller: loginController.passwordController),
                  SizedBox(
                    height: 20.h,
                  ),
                  RoundedButton(text: "LOGIN", press: () {
                    if(loginController.emailController.text != "" && loginController.passwordController.text != "") {
                      loginController.login();
                    } else {
                      Get.snackbar("Warning", "Email atau Password harus diisi !",margin: EdgeInsets.all(10.h), backgroundColor: Colors.amber);
                    }
                  }),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Belum Punya Akun ? ",
                    style: TextStyle(fontSize: 10.h),
                  ),
                  RoundedButton(
                      text: "Register",
                      color: kSecondaryColor,
                      press: () => Get.to(() => Register()))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
