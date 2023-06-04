import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_u_app/controllers/hotel_controller.dart';
import 'package:stay_u_app/helpers/helper.dart';
import 'package:stay_u_app/view/constant/colors.dart';
import 'package:stay_u_app/view/constant/components/rounded_button.dart';
import 'package:stay_u_app/view/constant/components/rounded_input_field.dart';
import 'package:stay_u_app/view/screens/home/components/custom_image.dart';
import 'package:stay_u_app/view/screens/home/components/recommendation_item.dart';

class Booking extends StatelessWidget {
  Booking({Key? key, required this.hotelId, required this.userId}) {
    hotelController.getDetail(hotelId);
  }

  final int hotelId;
  final int userId;
  final HotelController hotelController = Get.find<HotelController>();
  String image = "";




  @override
  Widget build(BuildContext context) {
    final hotelController =  Get.find<HotelController>();
    return Scaffold(
      backgroundColor: kLight,
      appBar: AppBar(
        backgroundColor: kLight,
        foregroundColor: kDark,
        title: Text("Konfirmasi Booking"),
      ),
      body: Obx(() {
        var hotel = hotelController.hotel.value!;
        if(hotel.tipeKamar == "Standard"){
          image = "https://images.unsplash.com/photo-1541123356219-284ebe98ae3b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60";
        } else if(hotel.tipeKamar == "Superior"){
          image = "https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60";
        } else {
          image = "https://images.unsplash.com/photo-1571508601891-ca5e7a713859?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60";
        }
        return Padding(
          padding: EdgeInsets.all(10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10.h),
                width: double.infinity,
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
              SizedBox(height: 10.h,),
              GestureDetector(
                onTap: () => hotelController.showCheckIn(),
                  child: DateInputField(
                    hintText: "Tanggal Check In",
                    icon: Icons.calendar_month,
                    controller: hotelController.checkInController,
                  )
              ),
              SizedBox(height: 10.h,),
              GestureDetector(
                onTap: () => hotelController.showCheckOut(),
                  child: DateInputField(
                    hintText: "Tanggal Check Out",
                    icon: Icons.calendar_month,
                    controller: hotelController.checkOutController,
                  )
              ),
              const Spacer(),
              Container(
                  padding: EdgeInsets.all(10.h),
                  child: Center(child: RoundedButton(text: ("Konfirmasi Booking").toUpperCase(), press: () => hotelController.booking(hotel.id, userId)))
              )
            ],
          ),
        );
      }),
    );
  }
  Widget buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Kamar " + (hotelController.hotel.value?.nomor.toString() ?? "1"),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: kDark,
            fontSize: 16.h,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          hotelController.hotel.value?.tipeKamar ?? "",
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
        Text(
          Helpers.convertRupiah(hotelController.hotel.value!.harga, 2),
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
