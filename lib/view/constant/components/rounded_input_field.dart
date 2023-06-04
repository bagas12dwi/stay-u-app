import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:stay_u_app/view/constant/colors.dart';
import 'package:stay_u_app/view/constant/components/text_field_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  const RoundedInputField(
      {Key? key,
      required this.hintText,
      this.icon = Icons.person,
      this.onChanged,
      this.controller,
      this.keyboardType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}

class DateInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController? controller;
  const DateInputField({Key? key, required this.hintText, required this.icon, this.controller,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: TextStyle(
            fontSize: 12.h,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 5.h,),
        Container(
          padding: EdgeInsets.all(5.h),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.h),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: TextFieldContainer(
            child: TextField(
              enabled: false,
              cursorColor: kPrimaryColor,
              controller: controller,
              decoration: InputDecoration(
                icon: Icon(
                  icon,
                  color: kPrimaryColor,
                ),
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const RoundedPasswordField({Key? key, this.onChanged, this.controller})
      : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool obscuredText = true;

  void changeObscuredText() {
    if (obscuredText == true) {
      obscuredText = false;
    } else {
      obscuredText = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: obscuredText,
        onChanged: widget.onChanged,
        controller: widget.controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: const Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
              icon: const Icon(
                Icons.visibility,
                color: kPrimaryColor,
              ),
              onPressed: changeObscuredText),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
