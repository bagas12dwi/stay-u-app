import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_u_app/view/screens/home/components/room_type_item.dart';

class RoomType extends StatefulWidget {
  const RoomType({Key? key}) : super(key: key);

  @override
  State<RoomType> createState() => _RoomTypeState();
}

class _RoomTypeState extends State<RoomType> {
  List tipeKamar = [
    {
      "name": "Standard",
      "image": "https://images.unsplash.com/photo-1541123356219-284ebe98ae3b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    },
    {
      "name": "Superior",
      "image": "https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    },
    {
      "name": "Deluxe",
      "image": "https://images.unsplash.com/photo-1571508601891-ca5e7a713859?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    }
  ];

  @override
  Widget build(BuildContext context) {
    // print(tipeKamar[0]['name']);
    return CarouselSlider(
        options: CarouselOptions(
            height: 200.h,
            enlargeCenterPage: true,
            disableCenter: true,
            viewportFraction: .75
        ),
        items: List.generate(
            tipeKamar.length,
                (index) => RoomTypeItem(
                    data: tipeKamar[index]
                )
        ),
    );
  }
}
