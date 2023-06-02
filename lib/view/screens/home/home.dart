import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_u_app/controllers/login_controller.dart';
import 'package:stay_u_app/helpers/helper.dart';
import 'package:stay_u_app/view/constant/colors.dart';
import 'package:stay_u_app/view/screens/home/home_screen.dart';
import 'package:stay_u_app/view/screens/hotels/hotels.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final int id;
  final LoginController userController = Get.find<LoginController>();

  Home({super.key, required this.id}) {
    userController.getDetail(id);
  }

  final MyController myController = Get.put(MyController());

  

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  Scaffold(
          backgroundColor: kLight,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: kLight,
                foregroundColor: kDark,
                automaticallyImplyLeading: false,
                floating: true,
                snap: true,
                pinned: true,
                title: _builAppBar(),
              ),
              SliverToBoxAdapter(
                child: myController.screens.value[myController.selectedIndex.value],
              )
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            items: const [
              Icon(Icons.home, color: kLight),
              Icon(Icons.hotel, color: kLight,)
            ],
            index: 0,
            backgroundColor: kLight,
            color: kPrimaryColor,
            onTap: (index) => myController.onTapped(index),
          ),
        )
    );
  }
  Widget _builAppBar() {
    var user = userController.user.value;
    return Row(
      children:  [
        Icon(
          Icons.person,
          color: kPrimaryColor,
          size: 20,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "Selamat Datang, " + Helpers.getFirstText((user?.nama ?? "")),
          style: TextStyle(
            color: kDark,
            fontSize: 20,
          ),
        ),
        const Spacer(),
        Icon(
          Icons.logout,
          color: kPrimaryColor,
          size: 20,)
      ],
    );
  }
}

class MyController extends GetxController{
  var screens = [
    HomeScreen(),
    Hotels()
  ].obs;
  var selectedIndex = 0.obs;


  @override
  void onInit() {
    super.onInit();
    onTapped(selectedIndex.value);
  }

  void onTapped (var index){
    selectedIndex.value = index;
  }
}

