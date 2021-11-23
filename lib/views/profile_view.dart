import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/constants/const_svg.dart';
import 'package:instagram/services/auth.dart';
import 'package:instagram/wrapper.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text('FozanKh', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
          actions: [
            SvgPicture.asset(kAddSvgAsset),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SvgPicture.asset(kBurgerSvgAsset),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(colors: [Color(0xFFF7A34B), Color(0xFFDE0046)]),
                        ),
                        padding: EdgeInsets.all(2.5),
                        child: Container(
                          height: 90,
                          width: 90,
                          padding: EdgeInsets.all(2.5),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Color(0xFFF7A34B), Color(0xFFDE0046)]),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(
                                kWatermelonBGLink,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text('0,000', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                          Text('Posts', style: TextStyle(fontSize: 13)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('0,000', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                          Text('Followers', style: TextStyle(fontSize: 13)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('0,000', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                          Text('Following', style: TextStyle(fontSize: 13)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Fozan Alkhalawi", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                  SizedBox(height: 5),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt #hashtag",
                    style: TextStyle(fontSize: 13),
                  ),
                  SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black)),
                  ),
                ],
              ),
            ),
            TabBar(
              indicatorColor: Colors.black,
              tabs: [
                Tab(icon: SvgPicture.asset(kGridSvgAsset)),
                Tab(icon: SvgPicture.asset(kMentionsSvgAsset)),
              ],
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                children: [
                  PhotosGrid(),
                  PhotosGrid(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PhotosGrid extends StatelessWidget {
  const PhotosGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(
        kImages.length,
        (index) => Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 0.5)),
          child: Image.network(
            kImages[index],
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}