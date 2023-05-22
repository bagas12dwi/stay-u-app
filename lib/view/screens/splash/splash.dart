import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_u_app/view/constant/colors.dart';
import 'package:stay_u_app/view/constant/components/rounded_button.dart';
import 'package:stay_u_app/view/screens/login/login.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => FutureBuilder(
              future: Future.delayed(const Duration(seconds: 4)),
              builder: (context, AsyncSnapshot snapshot) {
                return Scaffold(
                  body: SafeArea(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 150.h,
                            width: 150.h,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("./assets/logotel.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Center(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: RoundedButton(
                                text: "Get Started",
                                color: kPrimaryColor,
                                press: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Login()));
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ));
  }
}
