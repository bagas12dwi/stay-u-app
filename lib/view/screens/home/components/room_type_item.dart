import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/src/screen_util.dart';
import 'package:stay_u_app/view/constant/colors.dart';
import 'package:stay_u_app/view/screens/home/components/custom_image.dart';

class RoomTypeItem extends StatelessWidget {
  const RoomTypeItem({
    Key? key,
    this.data}) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.h,
      height: 300.h,
      padding: EdgeInsets.all(8.h),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.h),
        boxShadow: [
          BoxShadow(
            color: kDark.withOpacity(0.5),
            spreadRadius: .1,
            blurRadius: 5,
            offset: const Offset(1,1)
          ),
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImage(
            data["image"],
            radius: 15.h,
            height: 150.h,
            width: double.infinity,
          ),
          Container(
            width: 200.h - 20,
            padding: EdgeInsets.all(5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.h,
                    color: kDark,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
