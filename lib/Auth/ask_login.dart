import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../screens/Home/Test_Page.dart';
import 'authScreens/doctor_login/doctor_login.dart';
import 'authScreens/login_screen.dart';

class AskLoginScreen extends StatefulWidget {
  const AskLoginScreen({Key? key}) : super(key: key);
  @override
  State<AskLoginScreen> createState() => _AskLoginScreenState();
}
class _AskLoginScreenState extends State<AskLoginScreen> {


   int currentpage = 0;
  
 @override

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 150,
              ),
              Image.asset(
                  'assets/login.jpg',
                width: 200,
                height: 200,
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(15),
                  child:  Text(
                    'Welcome'.tr().toString(),
                    style: TextStyle(fontSize: 20,
                      color: Colors.grey,
                    ),
                  )),
             Container(
                width: 250,
                child: MaterialButton(     
                  elevation: 5.0,
                    color: const Color(0xff4696a1),
                    padding: EdgeInsets.symmetric(
                      vertical: 15,          
                      horizontal: 20,
                    ),
                    child: Text(
                      'Login as Patient'.tr().toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        },));
                      });
                      /// Go TO Home
                    }
                    ),
              ),
              const SizedBox(height: 15.0),
              Container(
                width: 250,
                child: MaterialButton(     
                  elevation: 5.0,
                    color: const Color(0xff4696a1),
                    padding: EdgeInsets.symmetric(
                      vertical: 15,          
                      horizontal: 20,
                    ),
                    child: Text(
                      'Login as Doctor'.tr().toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return DoctorLoginScreen();
                        },));
                      });
                      /// Go TO Home
                    }
                    ),
              ),
             
  
            ],
          ),
        ),
      ),
    );
  }
}
