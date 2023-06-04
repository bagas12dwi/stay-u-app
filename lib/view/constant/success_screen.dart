import 'package:flutter/material.dart';
import 'package:stay_u_app/view/constant/components/rounded_button.dart';
import 'package:get/get.dart';
import 'package:stay_u_app/view/screens/home/home.dart';

class SuccessScreen extends StatelessWidget {
  SuccessScreen({Key? key, required this.text, required this.id}) : super(key: key);
  final String text;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            padding: EdgeInsets.all(2),
            child: Image.asset("assets/success.gif"),
          ),
          Padding(padding: EdgeInsets.all(10.0),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: RoundedButton(
                text: ("Kembali Ke Halaman Utama").toUpperCase(),
                press: () => Get.offAll(() => Home(id: id,))
            )
          )
        ],
      ),
    );
  }
}
