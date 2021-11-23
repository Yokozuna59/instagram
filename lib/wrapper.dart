// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:instagram/services/auth.dart';
import 'package:instagram/views/main_view.dart';
import 'package:instagram/views/sign_in_view.dart';

class Wrapper extends StatelessWidget {
  Wrapper({Key key}) : super(key: key);

  bool isSignedIn = Auth.getUser() != null;

  // if Auth.getUser() == null
  // isSignedIn == false
  // if Auth.getUser() != null
  // isSignedIn == true

  @override
  Widget build(BuildContext context) {
    if (isSignedIn) {
      return MainView();
    } else {
      return SignInView();
    }
  }
}