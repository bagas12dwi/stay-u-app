import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_u_app/models/hotel_model.dart';
import 'package:stay_u_app/view/constant/colors.dart';
import 'package:stay_u_app/view/screens/home/components/custom_image.dart';
import 'package:stay_u_app/view/screens/hotels/hotel_details.dart';
import 'package:get/get.dart';
import 'package:stay_u_app/helpers/helper.dart';

class RecommendationItem extends StatelessWidget {
  RecommendationItem({Key? key, required this.data}) : super(key: key);

  final Hotel data;
  String image = "-";

  @override
  Widget build(BuildContext context) {
    if(data.tipeKamar == "Standard"){
      image = "https://images.unsplash.com/photo-1541123356219-284ebe98ae3b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60";
    } else if(data.tipeKamar == "Superior"){
      image = "https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60";
    } else {
      image = "https://images.unsplash.com/photo-1571508601891-ca5e7a713859?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60";
    }
    return GestureDetector(
      onTap: () => Get.to(() => HotelDetails(hotelId: data.id,)),
      child: Container(
        margin: EdgeInsets.only(right: 10.h),
        padding: EdgeInsets.all(10.h),
        width: 200.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.h),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            _buildImage(),
            SizedBox(
              width: 10.h,
            ),
            Expanded(
              child: buildInfo(),
            )
          ],
        ),
      ),
    );
  }
  Widget buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Kamar " + data.nomor.toString(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: kDark,
            fontSize: 16.h,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          data.tipeKamar,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: kDark,
            fontSize: 12.h,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        SizedBox(
          height: 15.h,
        ),
        _buildRateAndPrice(),
      ],
    );
  }

  Widget _buildRateAndPrice() {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 14.h,
          color: Colors.yellow,
        ),
        SizedBox(
          width: 3.h,
        ),
        Expanded(
          child: Text(
            data.rate.toString(),
            style: TextStyle(fontSize: 12.h, color: Colors.grey),
          ),
        ),
        Text(
          Helpers.convertRupiah(data.harga, 2),
          style: TextStyle(
            fontSize: 12.h,
            fontWeight: FontWeight.w500,
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return CustomImage(
      image,
      radius: 15.h,
      height: 50.h,
    );
  }
}
