import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_u_app/view/constant/colors.dart';
import 'package:stay_u_app/view/constant/components/rounded_button.dart';
import 'package:stay_u_app/view/screens/home/components/custom_image.dart';

class HotelDetails extends StatelessWidget {
  const HotelDetails({Key? key}) : super(key: key);

  final bool isNetwork = true;
  final String image = "https://images.unsplash.com/photo-1571508601891-ca5e7a713859?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLight,
      appBar: AppBar(
        backgroundColor: kLight,
        foregroundColor: kDark,
        title: const Text("Detail Kamar"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
        width: double.infinity,
        height: 250.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.h),
        ),
        child: isNetwork
            ? buildNetworkImage()
            : Image(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
          Container(
            padding: EdgeInsets.all(10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Deluxe",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.h
                  ),
                ),
                Text(
                  "Rp. 100.000",
                  style: TextStyle(
                      fontSize: 16.h
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Center(child: Padding(
            padding: EdgeInsets.all(20.h),
            child: RoundedButton(text: "BOOKING", press: () {}),
          ))
        ],
      ),
    );
  }

  Widget buildNetworkImage() {
    return CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) => BlankImageWidget(),
      errorWidget: (context, url, error) => BlankImageWidget(),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
