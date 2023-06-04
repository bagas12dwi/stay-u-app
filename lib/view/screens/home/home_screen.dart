import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_u_app/controllers/hotel_controller.dart';
import 'package:stay_u_app/view/constant/colors.dart';
import 'package:stay_u_app/view/screens/home/components/recomendation.dart';
import 'package:stay_u_app/view/screens/home/components/room_type.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.userId}) : super(key: key);

  final HotelController hotelController = Get.put(HotelController());
  final int userId;

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rekomendasi",
                  style: TextStyle(
                      color: kDark,
                      fontSize: 20.h,
                      fontWeight: FontWeight.bold
                  ),
                ),
                GestureDetector(
                    onTap: () => hotelController.getRekomendasi(),
                    child: const Icon(
                        Icons.refresh)
                )
              ],
            ),
          ),
          SizedBox(height: 10.h,),
          Recommendation(userId: userId,)
        ],
      ),
    );
  }
}