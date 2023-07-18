import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Home/Test_Page.dart';
import 'package:flutter_application_1/splash/splash_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileInfo extends StatefulWidget {
  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

var name = "Fatma";
var age = "20";
var phone = "0120000002";
var email = "fatma@test.com";
var type = "Male";

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  String UserName = "";
  String phoneNumber = "";
  String dateOfBirth = "";
  String Gender = "";
  Future<void> getName() async {
    SharedPreferences userData = await SharedPreferences.getInstance();
    setState(() {
      UserName = userData.getString("UserName")!;
      phoneNumber = userData.getString("phoneNumber")!;
      dateOfBirth = userData.getString("dateOfBirth")!;
      Gender = userData.getString("selectedGender")!;

      DateTime dateTime = DateTime.parse(dateOfBirth);
      String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
      dateOfBirth = formattedDate;
      print(dateOfBirth);
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.teal),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) {
                return TestPage();
              },
            ));

            ///
          },
        ),
        title: Text(
          "ProfileInformation".tr().toString(),
          style: TextStyle(color: Colors.teal),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Center(
                  child: SvgPicture.asset(
                "assets/profile.svg",
                width: 120,
                height: 120,
              )),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.grey[400]),
              width: double.infinity,
              height: 50.0,
              child: Center(
                child: Text(
                  ("Name:".tr().toString() + " $UserName"),
                  style: TextStyle(
                      fontSize: 25,
                      color: Color.fromRGBO(0, 0, 0, 0.65),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.grey[400]),
              width: double.infinity,
              height: 50.0,
              child: Center(
                child: Text(
                  ("Age:".tr().toString() + " $dateOfBirth"),
                  style: TextStyle(
                      fontSize: 25,
                      color: Color.fromRGBO(0, 0, 0, 0.65),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.grey[400]),
              width: double.infinity,
              height: 50.0,
              child: Center(
                child: Text(
                  ("Phone:".tr().toString() + " $phoneNumber"),
                  style: TextStyle(
                      fontSize: 25,
                      color: Color.fromRGBO(0, 0, 0, 0.65),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
         
            Container(
              decoration: BoxDecoration(color: Colors.grey[400]),
              width: double.infinity,
              height: 50.0,
              child: Center(
                child: Text(
                  ("Type:".tr().toString() + " $Gender"),
                  style: TextStyle(
                      fontSize: 25,
                      color: Color.fromRGBO(0, 0, 0, 0.65),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: (() {
                setState(() {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return SplashView();
                      ;
                    },
                  ));
                });
              }),
              child: Text(
                "LogOut".tr().toString(),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// your QR code is private .if you share it with someone they can scan it