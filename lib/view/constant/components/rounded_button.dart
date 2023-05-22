import 'package:flutter/material.dart';
import 'package:stay_u_app/view/constant/colors.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final GestureTapCallback press;
  final Color color, textColor;
  const RoundedButton(
      {super.key,
      required this.text,
      required this.press,
      this.color = kPrimaryColor,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: MaterialButton(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
