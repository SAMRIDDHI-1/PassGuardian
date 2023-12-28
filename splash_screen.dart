import 'dart:async';
import 'package:flutter/material.dart';
import 'package:passdiary/database/secure_storage.dart';
import 'package:passdiary/screens/login_screen.dart';
import 'package:passdiary/screens/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // reference our box
    //final myBox = Hive.box('myBox');
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  // Where to Go Function
  void whereToGo() async {
    // initializing sharedpreferences
    var sharedPref = await SharedPreferences.getInstance();
    var isRegistered = sharedPref.getBool("Reg");

    Timer(
      const Duration(seconds: 2),
      () {
        print('>>>>>>>>>>>>>${SecureStorageClass().readSecureData('pass')}');

        if (isRegistered != null) {
          if (isRegistered) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          } else {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => RegisterScreen()));
          }
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => RegisterScreen()));
        }
      },
    );
  }
}
