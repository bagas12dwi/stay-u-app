import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_u_app/controllers/hotel_controller.dart';
import 'package:stay_u_app/view/constant/colors.dart';
import 'package:stay_u_app/view/screens/hotels/components/hotel_lists.dart';
import 'package:get/get.dart';

class Hotels extends StatelessWidget {
  Hotels({Key? key}) : super(key: key);

  final HotelController hotelController = Get.put(HotelController());


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Kamar Tersedia",
                style: TextStyle(
                    color: kDark,
                    fontSize: 16.h,
                    fontWeight: FontWeight.bold
                ),
              ),
              GestureDetector(
                onTap: () => hotelController.getHotel(),
                  child: const Icon(
                      Icons.refresh)
              )
            ],
          ),
          HotelLists()
        ],
      ),
    );
  }
}
