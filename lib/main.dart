import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instagram/wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container(color: Colors.red);
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(home: Wrapper(), debugShowCheckedModeBanner: false,);
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container(color: Colors.blue);
      },
    );
  }
}