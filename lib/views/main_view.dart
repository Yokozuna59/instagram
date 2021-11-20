import 'package:instagram/constants/svg_const.dart';
import 'package:instagram/views/home_view.dart';
import 'package:instagram/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainView extends StatefulWidget {
  const MainView({Key key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset(kHomeSvgAsset), label: 'Home'),
          BottomNavigationBarItem(
            icon: Image.network(
              "https://firebasestorage.googleapis.com/v0/b/fozan-kh.appspot.com/o/watermelon.png?alt=media&token=0c4c219d-4376-432b-a3b7-598e42803bb9",
              height: 30,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          HomeView(),
          ProfileView(),
        ],
      ),
    );
  }
}