import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_u_app/view/constant/colors.dart';
import 'package:stay_u_app/view/services/wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => const MaterialApp(
              themeMode: ThemeMode.system,
              title: 'Stay U',
              debugShowCheckedModeBanner: false,
              home: Wrapper(),
        ));
  }
}

