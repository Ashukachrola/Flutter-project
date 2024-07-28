import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'first_loginpage.dart';  // Ensure the correct path

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstLoginPage(),
    );
  }
}
