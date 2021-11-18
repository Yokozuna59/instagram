// ignore_for_file: prefer_const_constructors

import 'package:instagram/constants.dart';
import 'package:instagram/home_view.dart';
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
              "https://i.postimg.cc/hGqqvDQG/Yokozuna.jpg",
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
          Container(),
        ],
      ),
    );
  }
}