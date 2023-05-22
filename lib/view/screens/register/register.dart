import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stay_u_app/view/constant/components/rounded_button.dart';
import 'package:stay_u_app/view/constant/components/rounded_input_field.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final String assetName = "./assets/register.svg";

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
                  const RoundedInputField(hintText: "email"),
                  const RoundedPasswordField(),
                  SizedBox(
                    height: 20.h,
                  ),
                  RoundedButton(text: "Daftar", press: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
