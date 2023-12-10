import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trills/all_assets.dart';
import 'package:trills/background.dart';
import 'package:trills/routes.dart';

// import 'package:animated_text/animated_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  SplashScreenState();

  bool _showProgress = true;
  navigate() {
    // Future.delayed(Duration(seconds: 3));
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Navigator.pushNamed(context, Routes.homePage);
    });
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      navigate();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        widget: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.all(10.0),
                    child: const Image(
                      image: AssetImage(AllAssests.backgroundImage),
                      width: 250.0,
                      height: 250.0,
                    )),
                Text(
                  'Trills',
                  style: TextStyle(
                    fontFamily: 'FontMain',
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (_showProgress) CircularProgressIndicator()
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
