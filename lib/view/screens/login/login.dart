import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stay_u_app/view/constant/colors.dart';
import 'package:stay_u_app/view/constant/components/rounded_button.dart';
import 'package:stay_u_app/view/constant/components/rounded_input_field.dart';
import 'package:stay_u_app/view/screens/home/home.dart';
import 'package:stay_u_app/view/screens/register/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final String assetName = "./assets/login.svg";

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
                  const RoundedInputField(hintText: "email"),
                  const RoundedPasswordField(),
                  SizedBox(
                    height: 20.h,
                  ),
                  RoundedButton(text: "LOGIN", press: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Home()))),
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
                      press: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Register())))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
