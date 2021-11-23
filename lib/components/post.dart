import 'package:instagram/constants/const_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Post extends StatelessWidget {
  const Post({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Image.network(
                "https://i.postimg.cc/YqSyvH1w/51-E09-D86-9-F07-41-B9-99-B3-DC957964902-F.jpg",
                height: 30,
              ),
              SizedBox(width: 10),
              Text('Yokozuna59'),
              Spacer(),
              SvgPicture.asset(kMoreSvgAsset),
            ],
          ),
        ),
        Image.network(
          "https://i.postimg.cc/pd0sW-LV4/E913-B0-F3-C239-4207-AD7-B-836997-F5-A81-F.jpg",
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(kHeartSvgAsset),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SvgPicture.asset(kCommentSvgAsset),
                  ),
                  SvgPicture.asset(kShareSvgAsset),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text('100 Likes'),
              ),
              RichText(
                text: TextSpan(
                  text: 'Developer ',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt... more',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
              // Text(
              //     'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt... more')
            ],
          ),
        ),
      ],
    );
  }
}