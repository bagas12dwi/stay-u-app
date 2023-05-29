import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_u_app/view/constant/colors.dart';
import 'package:stay_u_app/view/screens/home/components/recomendation.dart';
import 'package:stay_u_app/view/screens/home/components/room_type.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Text(
              "Cari dan Booking",
              style: TextStyle(
                color: kDark,
                fontSize: 16.h
              ),
            ),
          ),
          SizedBox(height: 5.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Text(
              "Tipe Kamar Hotel",
              style: TextStyle(
                  color: kDark,
                  fontSize: 20.h,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 10.h,),
          RoomType(),
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Text(
              "Rekomendasi",
              style: TextStyle(
                  color: kDark,
                  fontSize: 20.h,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 10.h,),
          Recommendation()
        ],
      ),
    );
  }
}