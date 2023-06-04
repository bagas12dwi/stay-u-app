import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stay_u_app/helpers/api.dart';
import 'package:stay_u_app/models/booking_model.dart';
import 'package:stay_u_app/models/hotel_model.dart';
import 'package:stay_u_app/providers/hotel_provider.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:stay_u_app/view/constant/success_screen.dart';

class HotelController extends GetxController{
  var isLoading = false.obs;
  var hotelList = <Hotel>[].obs;
  var hotelRecommendation = <Hotel>[].obs;
  var hotel = Rxn<Hotel>();
  var status_code;
  late TextEditingController checkInController;
  late TextEditingController checkOutController;


  @override
  void onInit() {
    super.onInit();
    checkInController = TextEditingController();
    checkOutController = TextEditingController();
    getHotel();
    getRekomendasi();
  }

  void getHotel() async{
    try {
      isLoading.value = false;
      var hotels = await HotelProvider().getHotels();
      hotelList.assignAll(hotels);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = true;
    }
  }

  void getRekomendasi() async{
    try {
      isLoading.value = false;
      var hotels = await HotelProvider().getRekomendasi();
      hotelRecommendation.assignAll(hotels);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = true;
    }
  }

  void getDetail(int idHotel) async {
    try {
      var hotelData = await HotelProvider().getDetail(idHotel);
      hotel.value = hotelData;
    } catch (e) {
      print(e);
    }
  }

  void booking(int idHotel, int idUser) async {
    try {
      var booking = Booking(tglPesan: checkInController.text, tglAkhir: checkOutController.text, id: idUser);
      var response = await http.put(Uri.parse(Api.baseUrl + '/booking/' + idHotel.toString()),
          body: json.encode(booking.toJson()),
          headers: {'Content-type':'application/json'}
      );
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        status_code = responseData['status_code'];
        if(status_code == 200){
          return Get.offAll(() => SuccessScreen(text: "Booking Berhasil", id: idUser));
        } else {
          return status_code;
        }
      }
    } catch (e){
      print(e);
    }
  }

  showCheckIn() async{
    DateTime? pickedData = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2102)
    );

    if(pickedData != null) {
      checkInController.text = DateFormat('yyyy-MM-dd').format(pickedData);
    }
  }
  showCheckOut() async{
    DateTime? pickedData = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2102)
    );

    if(pickedData != null) {
      checkOutController.text = DateFormat('yyyy-MM-dd').format(pickedData);
    }
  }
}