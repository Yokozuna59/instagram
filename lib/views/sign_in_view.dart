import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/constants/const_svg.dart';
import 'package:instagram/views/main_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              kLogoSvgAsset,
              width: 209,
              height: 60,
            ),
            SizedBox(height: 40),
            TextField(
              onChanged: (value) {
                username = value;
              },
              decoration: InputDecoration(
                hintText: 'Email',
                fillColor: Color(0xffFAFAFA),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xffC4C4C4), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xffC4C4C4), width: 1),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                fillColor: Color(0xffFAFAFA),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xffC4C4C4), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xffC4C4C4), width: 1),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Color(0xff5ACBFE),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                if (username == '7b7b' && password == '1234') {
                  print('Login Successes');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainView()));
                } else {
                  print('Login failed');
                }
              },
              color: Color(0xff5ACBFE),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}