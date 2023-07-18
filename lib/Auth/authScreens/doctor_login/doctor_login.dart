import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../screens/DoctorHome/doctor_page.dart';
import '../../../screens/UnUesd/register_screen.dart';
import '../../auth/loginApi.dart';
import 'doctor_register.dart';

class DoctorLoginScreen extends StatefulWidget {
  const DoctorLoginScreen({Key? key}) : super(key: key);
  @override
  State<DoctorLoginScreen> createState() => _DoctorLoginScreenState();
}

class _DoctorLoginScreenState extends State<DoctorLoginScreen> {
    bool isPasswordVisible = false;

  int currentpage = 0;
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Container(
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
                  child: Text(
                    'Welcome Doctor'.tr().toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  )),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'phone'.tr().toString(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
                TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                keyboardType: TextInputType.visiblePassword,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                /// to make tap for anyThing
                onTap: () {
                  print('Forget password ?');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forget'.tr().toString(),
                      style: TextStyle(
                        color: const Color(0xff4696a1),
                        fontSize: 15,
                      ),
                    ),
                  ],
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
                      'signin'.tr().toString(),
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() async {
                          await login(
                              phoneController.text, passwordController.text);
                          print("Done");
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          bool isLoggedIn = false;
                          Future.delayed(const Duration(seconds: 1), () {
                            isLoggedIn = prefs.getBool('isLoggedInS') ?? false;
                            print(isLoggedIn);
                          });
                          // late bool isLoggedIn;
                          Future.delayed(const Duration(seconds: 2), () {
                            if (isLoggedIn) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Your login successful'),
                                    actions: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.teal,
                                        ),
                                        child: Text('OK'),
                                        onPressed: () {
                                          phoneController.text = "";
                                          passwordController.text = "";

                                           setState(() {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                              builder: (context) {
                                                return DoctorPage();
                                              },
                                            ));
                                          });
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              // SharedPreferences prefs =
                              //     await SharedPreferences.getInstance();
                              // prefs.setBool('isLoggedInS', false);
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Your login failed'),
                                    content:
                                        Text('please try again or sign Up'),
                                    actions: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.teal,
                                        ),
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          });
                        });
                      }

                      /// Go TO Home
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Text('dontHave'.tr().toString()),
                  TextButton(
                    child: Text(
                      'Signup'.tr().toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color(0xff4696a1),
                      ),
                    ),
                    onPressed: () {
                      // == ontap
                      //signup screen
                      setState(() {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            return DoctorRegisterScreen();
                          },
                        ));
                      });
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
