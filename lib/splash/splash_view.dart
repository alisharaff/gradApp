import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/resources/color_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../onboarding/onboarding_view.dart';
import '../resources/constants_manager.dart';


class SplashView extends StatefulWidget{
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: ((context) {
      return OnBoardingView();
    })));
  }

  @override
  void initState() {
    
    super.initState();
    _startDelay(); // to do first 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Image(image: AssetImage("assets/splash_logo.png"))),
          Center(
              child: Text(
            "Parkinson's",
            style: TextStyle(fontSize: 40.0, color: ColorManager.logoColor),
          )),
          Center(
              child: Text(
            "Disease",
            style: TextStyle(fontSize: 40.0, color: ColorManager.logoColor),
          )),
          SpinKitThreeInOut(size: 25,color: ColorManager.logoColor),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel(); //stop
    super.dispose();
  }
}
