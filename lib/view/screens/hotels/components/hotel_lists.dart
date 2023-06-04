import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_u_app/controllers/hotel_controller.dart';
import 'package:stay_u_app/view/screens/home/components/recommendation_item.dart';
import 'package:get/get.dart';

class HotelLists extends StatelessWidget {
  HotelLists({Key? key, required this.userId}) : super(key: key);

  final int userId;

  @override
  Widget build(BuildContext context) {
    final hotelController =  Get.find<HotelController>();
    return Obx(() => ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var hotel = hotelController.hotelList[index];
        return Container(
            margin: EdgeInsets.only(bottom: 10.h),
            child: RecommendationItem(data: hotel, userId: userId,)
        );
      },
      itemCount: hotelController.hotelList.length,
    ));
  }
}
