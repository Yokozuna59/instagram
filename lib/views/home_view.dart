import 'package:instagram/components/post.dart';
import 'package:instagram/constants/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram/models/post.dart';
import 'package:instagram/views/add_post_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Post> posts;

  @override
  void initState() {
    loadPosts();
    super.initState();
  }

  loadPosts() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: SvgPicture.asset(kLogoSvgAsset),
        actionsIconTheme: IconThemeData(color: Colors.black),
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPostView(),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: SvgPicture.asset(kAddSvgAsset),
            ),
          ),
          SvgPicture.asset(kHeartSvgAsset),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: SvgPicture.asset(kMessengerSvgAsset),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PostViewer(),
            PostViewer(),
            PostViewer(),
            PostViewer(),
            PostViewer(),
            PostViewer(),
            PostViewer(),
            PostViewer(),
          ],
        ),
      ),
    );
  }
}