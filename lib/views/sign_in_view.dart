import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/constants/svgs.dart';
import 'package:instagram/services/auth.dart';
import 'package:instagram/views/sign_up_view.dart';
import 'package:instagram/wrapper.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Spacer(),
              Column(
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
                      email = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      fillColor: Color(0xFFFAFAFA),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Color(0xffC4C4C4), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
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
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Color(0xffC4C4C4), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Color(0xffC4C4C4), width: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Color(0xff5ACBFE), fontWeight: FontWeight.w700, fontSize: 11),
                    ),
                  ),
                  SizedBox(height: 30),
                  MaterialButton(
                    height: 40,
                    onPressed: () async {
                      await Auth.signIn(email, password);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Wrapper(),
                          ));
                    },
                    color: Color(0xff5ACBFE),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpView())),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Don't have an account?",
                        style: TextStyle(decoration: TextDecoration.none), textAlign: TextAlign.center),
                    SizedBox(width: 5),
                    Text('Sign Up!', style: TextStyle(color: Color(0xff5ACBFE)), textAlign: TextAlign.center),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}