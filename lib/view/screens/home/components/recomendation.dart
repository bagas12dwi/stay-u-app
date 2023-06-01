import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_u_app/controllers/hotel_controller.dart';
import 'package:stay_u_app/view/screens/home/components/recommendation_item.dart';
import 'package:get/get.dart';

class Recommendation extends StatelessWidget {

  List rekomendasi = [
    {
      "name": "Standard",
      "price": "Rp. 100.000",
      "rate": "5",
      "image": "https://images.unsplash.com/photo-1541123356219-284ebe98ae3b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    },
    {
      "name": "Superior",
      "price": "Rp. 200.000",
      "rate": "3.5",
      "image": "https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    },
    {
      "name": "Deluxe",
      "price": "Rp. 300.000",
      "rate": "4.5",
      "image": "https://images.unsplash.com/photo-1571508601891-ca5e7a713859?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    }
  ];


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
              hotelController.hotelRecommendation.length, (index) => RecommendationItem(data: hotelController.hotelRecommendation[index])),
        )
      )
    );
  }
}
