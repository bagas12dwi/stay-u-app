import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_u_app/view/constant/colors.dart';
import 'package:stay_u_app/view/screens/home/home_screen.dart';
import 'package:stay_u_app/view/screens/hotels/hotels.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  @override

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  var screens = [
    HomeScreen(),
    Hotels()
  ];

  void _onTapped (int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
            child: screens[_selectedIndex],
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
        onTap: _onTapped,
      ),
    );
  }
}

Widget _builAppBar() {
  return Row(
    children: const [
      Icon(
        Icons.person,
        color: kPrimaryColor,
        size: 20,
      ),
      SizedBox(
        width: 10,
      ),
      Text(
        "Selamat Datang, Bagas",
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