import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_u_app/view/constant/colors.dart';
import 'package:stay_u_app/view/screens/home/components/custom_image.dart';

class RecommendationItem extends StatelessWidget {
  const RecommendationItem({Key? key, required this.data}) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
  Widget buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data["name"],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: kDark,
            fontSize: 16.h,
            fontWeight: FontWeight.w600,
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
            data["rate"],
            style: TextStyle(fontSize: 12.h, color: Colors.grey),
          ),
        ),
        Text(
          data["price"],
          style: TextStyle(
            fontSize: 14.h,
            fontWeight: FontWeight.w500,
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return CustomImage(
      data["image"],
      radius: 15.h,
      height: 50.h,
    );
  }
}
