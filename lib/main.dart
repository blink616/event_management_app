import 'dart:async';
import 'package:flutter/material.dart';
import './screens/ProfilePage.dart';
import './screens/loginscreen.dart';
import './screens/tempscreen.dart';
import './screens/EventList.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(primaryColor: Colors.black, fontFamily: 'JosefinSans'),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 350,
          ),
          CircleAvatar(
            radius: 100.0,
            backgroundColor: Colors.white,
            child: ClipRRect(
              child: Image.asset('assets/images/logo1.png'),
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
        ],
      ),
    );
  }
}

