import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_u_app/controllers/hotel_controller.dart';
import 'package:stay_u_app/helpers/helper.dart';
import 'package:stay_u_app/view/constant/colors.dart';
import 'package:stay_u_app/view/constant/components/rounded_button.dart';
import 'package:stay_u_app/view/screens/home/components/custom_image.dart';
import 'package:get/get.dart';
import 'package:stay_u_app/view/screens/hotels/booking.dart';

class HotelDetails extends StatelessWidget {
  final HotelController hotelController = Get.find<HotelController>();
  final int hotelId;
  final int userId;
  final bool isNetwork = true;
  String image = "https://images.unsplash.com/photo-1571508601891-ca5e7a713859?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60";
  String deskripsi = "";

  HotelDetails({super.key, required this.hotelId, required this.userId}){
    hotelController.getDetail(hotelId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLight,
      appBar: AppBar(
        backgroundColor: kLight,
        foregroundColor: kDark,
        title: const Text("Detail Kamar"),
      ),
      body: Obx(() {
        var hotel = hotelController.hotel.value!;
        if(hotel.tipeKamar == "Standard"){
          image = "https://images.unsplash.com/photo-1541123356219-284ebe98ae3b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60";
          deskripsi = "Kamar hotel standar adalah kamar yang nyaman dan fungsional yang cocok untuk tamu-tamu yang mencari penginapan yang sederhana dan terjangkau. Dalam kamar hotel standar, Anda akan menemukan tempat tidur yang nyaman, fasilitas dasar seperti meja dan kursi, serta kamar mandi pribadi dengan pancuran. Kamar hotel standar juga biasanya dilengkapi dengan televisi, AC, dan akses internet Wi-Fi gratis. Meskipun tidak memiliki kemewahan ekstra, kamar hotel standar menawarkan kenyamanan yang cukup untuk tamu-tamu yang ingin beristirahat dan bersantai setelah beraktivitas di luar. Dengan harga yang lebih terjangkau, kamar hotel standar adalah pilihan yang baik bagi wisatawan atau pebisnis yang mencari akomodasi yang sederhana dan fungsional.";
        } else if(hotel.tipeKamar == "Superior"){
          image = "https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60";
          deskripsi = "Kamar hotel superior adalah tipe kamar yang menawarkan tingkat kenyamanan dan fasilitas yang lebih baik daripada kamar standar. Dalam kamar hotel superior, Anda akan menemukan ruangan yang lebih luas dengan desain interior yang elegan dan modern. Tempat tidur yang nyaman dan berkualitas tinggi tersedia di kamar ini, seringkali dalam ukuran yang lebih besar seperti tempat tidur queen atau king.";
        } else {
          image = "https://images.unsplash.com/photo-1571508601891-ca5e7a713859?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60";
          deskripsi = "Kamar hotel deluxe adalah tipe kamar yang menawarkan tingkat keanggunan dan kemewahan yang lebih tinggi daripada kamar standar dan superior. Kamar hotel deluxe dirancang dengan desain yang elegan dan modern, menciptakan suasana yang mewah dan menenangkan bagi tamu yang menginap.";
        }
        return Column(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kamar ${hotel.nomor} (${hotel.tipeKamar})",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.h
                            ),
                          ),
                          SizedBox(height: 3.h,),
                          Text(
                            Helpers.convertRupiah(hotel.harga, 2),
                            style: TextStyle(
                                fontSize: 16.h
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 16.h,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 3.h,
                          ),
                          Text(
                            hotel.rate.toString(),
                            style: TextStyle(fontSize: 16.h, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Text(
                    "Deskripsi",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.h
                    ),
                  ),
                  SizedBox(height: 3.h,),
                  Text(
                    deskripsi,
                    style: TextStyle(
                        fontSize: 14.h
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(child: Padding(
              padding: EdgeInsets.all(20.h),
              child: RoundedButton(text: "BOOKING", press: () => Get.to(() => Booking(hotelId: hotelId, userId: userId))),
            ))
          ],
        );
      })
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
