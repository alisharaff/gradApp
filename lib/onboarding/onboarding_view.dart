// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_application_1/resources/color_manager.dart';
import '../Auth/ask_login.dart';
import '../Auth/authScreens/login_screen.dart';

import '../resources/assets_manager.dart';
import '../resources/values_manager.dart';

int _currentIndex = 0;

// << main class >>
class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      // <<  Start AppBar  >>
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark),
      ),
      // <<  End AppBar  >>
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
            if (_currentIndex > 1) {
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                return AskLoginScreen();
              })));
            }
          });
        },
        children: [
          OnBoardingPage(
            image: ImageAssets.onboardingLogo1,
            title: "onBoardingSubTitle1".tr().toString(),
          ),
          OnBoardingPage(
            image: ImageAssets.onboardingLogo2,
            title:"onBoardingSubTitle2".tr().toString(),
          ),
          AskLoginScreen(),
        ],
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: ((context) {
                    return AskLoginScreen();
                  })));
                },
                child: Text(
                  "skip".tr().toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  final image;
  final title;

  const OnBoardingPage({
    Key? key,
    required this.image,
    this.title,
  }) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
           alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {
               showAlertDialog(context);  
            },
            child: Text(
              "language".tr().toString(),
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.end,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s20),
        Container(
            width: 280,
            height: 280,
            alignment: Alignment.topCenter,
            child: Image.asset(widget.image)), //
        SizedBox(
          height: 35.0,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22.0, color: Color.fromARGB(164, 29, 28, 28)),
          ),
        ),
        const SizedBox(height: AppSize.s60),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 5,
                  color: _currentIndex == 0
                      ? ColorManager.circleColorloding
                      : ColorManager.grayColor,
                  style: BorderStyle.solid,
                ),
                shape: BoxShape.circle),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 5,
                  color: _currentIndex == 0
                      ? ColorManager.grayColor
                      : ColorManager.circleColorloding,
                  style: BorderStyle.solid,
                ),
                shape: BoxShape.circle),
          ),
        ]),
      ],
    );
  }
}
  
showAlertDialog(BuildContext context) {  
 
  
  // Create AlertDialog  
  AlertDialog alert = AlertDialog(  
    title: Text("Selct language"),  
    content: Container(
      height: 100.0,
      child: Column(children: [
          SizedBox(
            width: 120.0,
            child: ElevatedButton(  
        style: ElevatedButton.styleFrom(
            
       side: BorderSide(width:1, color:Color.fromARGB(255, 72, 107, 121)), //border width and color
       elevation: 1, //elevation of button
       shape: RoundedRectangleBorder( //to set border radius to button
                 
              )),
      child: Text("Arbic"),  
      onPressed: () {  
        EasyLocalization.of(context)?.setLocale(Locale('ar', ''));
      },  
  ),
          ), 
            SizedBox(
            width: 120.0,
            child: ElevatedButton(  
        style: ElevatedButton.styleFrom(
            
       side: BorderSide(width:1, color:Color.fromARGB(255, 72, 107, 121)), //border width and color
       elevation: 1, //elevation of button
       shape: RoundedRectangleBorder( //to set border radius to button
                 
              )),
      child: Text("English"),  
      onPressed: () {  
        EasyLocalization.of(context)?.setLocale(Locale('en', ''));
      },  
  ),
          ), 
     
      ],),
    ),  
    actions: [  

      ElevatedButton(  
    child: Text("OK"),  
    onPressed: () {  
      Navigator.of(context).pop();  
    },  
  ),  
    ],  
  );  
  
  // show the dialog  
  showDialog(  
    context: context,  
    builder: (BuildContext context) {  
      return alert;  
    },  
  );  
}  