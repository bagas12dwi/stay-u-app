import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_u_app/controllers/hotel_controller.dart';
import 'package:stay_u_app/controllers/login_controller.dart';
import 'package:stay_u_app/view/screens/home/components/recommendation_item.dart';
import 'package:get/get.dart';

class Recommendation extends StatelessWidget {
  Recommendation({super.key, required this.userId});

  final int userId;
  @override
  Widget build(BuildContext context) {
    final HotelController hotelController = Get.find<HotelController>();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.all(5.h),
      scrollDirection: Axis.horizontal,
      child: Obx(() =>
        Row(
          children: List.generate(
              hotelController.hotelRecommendation.length, (index) => RecommendationItem(data: hotelController.hotelRecommendation[index], userId: userId,)),
        )
      )
    );
  }
}
