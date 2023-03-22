import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_number/home.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:login_number/splash.dart';
import 'package:login_number/widget.dart';
import 'otp.dart';
import 'phone.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "splash",
    routes: {
      "phone": (context) => MyPhone(),
      "otp": (context) => MyOtp(),
      "home": (context) => MyHome(),
      "splash": (context) => SplashScreen(),
      "widget": (context) => MyWidget(),

    },
  ));
}
