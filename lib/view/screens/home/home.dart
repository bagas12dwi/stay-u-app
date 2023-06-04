import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_u_app/controllers/login_controller.dart';
import 'package:stay_u_app/helpers/helper.dart';
import 'package:stay_u_app/models/user_model.dart';
import 'package:stay_u_app/view/constant/colors.dart';
import 'package:stay_u_app/view/screens/home/home_screen.dart';
import 'package:stay_u_app/view/screens/hotels/hotels.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final int id;
  final LoginController userController = Get.put(LoginController());

  Home({super.key, required this.id}) {
    userController.getDetail(id);
  }
  
  @override
  Widget build(BuildContext context) {
    final MyController myController = Get.put(MyController(userController: userController, userId: id));
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
        const Icon(
          Icons.person,
          color: kPrimaryColor,
          size: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          "Selamat Datang, " + Helpers.getFirstText((user?.nama ?? "")),
          style: const TextStyle(
            color: kDark,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

class MyController extends GetxController {
  late LoginController userController;
  late int userId;

  MyController({required this.userController, required this.userId});

  var screens = <Widget>[].obs;
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    screens.addAll([
      HomeScreen(userId: userId),
      Hotels(userId: userId),
    ]);
    onTapped(selectedIndex.value);
  }

  void onTapped(int index) {
    selectedIndex.value = index;
  }
}


