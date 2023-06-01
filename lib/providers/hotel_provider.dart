import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stay_u_app/models/hotel_model.dart';
import 'package:stay_u_app/helpers/api.dart';

class HotelProvider {
  Future<List<Hotel>> getHotels() async {
    final response = await http.get(Uri.parse(Api.baseUrl + '/getKamar'));
    if(response.statusCode == 200){
      Map<String, dynamic> responseData = json.decode(response.body);
      List<dynamic> hotelsData = responseData['data'];
      List<Hotel> hotel = hotelsData.map((hotel) => Hotel.fromJson(hotel)).toList();
      return hotel;
    } else {
      throw Exception('Failed');
    }
  }

  Future<List<Hotel>> getRekomendasi() async {
    final response = await http.get(Uri.parse(Api.baseUrl + '/getRekomendasi'));
    if(response.statusCode == 200){
      Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData);
      List<dynamic> hotelsData = responseData['data'];
      List<Hotel> hotel = hotelsData.map((hotel) => Hotel.fromJson(hotel)).toList();
      return hotel;
    } else {
      throw Exception('Failed');
    }
  }
}