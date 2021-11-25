import 'package:instagram/constants/svgs.dart';
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
              "https://i.postimg.cc/YqSyvH1w/51-E09-D86-9-F07-41-B9-99-B3-DC957964902-F.jpg",
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