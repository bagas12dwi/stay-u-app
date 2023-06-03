import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stay_u_app/controllers/login_controller.dart';
import 'package:stay_u_app/view/constant/components/rounded_button.dart';
import 'package:stay_u_app/view/constant/components/rounded_input_field.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final String assetName = "./assets/register.svg";
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
                    "Register",
                    style:
                        TextStyle(fontSize: 16.h, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  RoundedInputField(hintText: "Nama Lengkap", controller: loginController.namaController,),
                  RoundedInputField(hintText: "Email", controller: loginController.emailController,),
                  RoundedPasswordField(controller: loginController.passwordController,),
                  SizedBox(
                    height: 20.h,
                  ),
                  RoundedButton(text: "Daftar", press: () => loginController.register()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
