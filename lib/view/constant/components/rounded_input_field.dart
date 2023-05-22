import 'package:flutter/material.dart';
import 'package:stay_u_app/view/constant/colors.dart';
import 'package:stay_u_app/view/constant/components/text_field_container.dart';

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
