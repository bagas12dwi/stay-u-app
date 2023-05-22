import 'package:flutter/material.dart';
import 'package:stay_u_app/view/screens/splash/splash.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) =>
            OrientationBuilder(builder: (context, Orientation orientation) {
              return const Splash();
            }));
  }
}
