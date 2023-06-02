import 'package:get/get.dart';
import 'package:stay_u_app/models/hotel_model.dart';
import 'package:stay_u_app/providers/hotel_provider.dart';

class HotelController extends GetxController{
  var isLoading = false.obs;
  var hotelList = <Hotel>[].obs;
  var hotelRecommendation = <Hotel>[].obs;
  var hotel = Rxn<Hotel>();


  @override
  void onInit() {
    super.onInit();
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
}