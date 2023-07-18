import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Home/type.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../screens/Home/Test_Page.dart';
import '../acount_google.dart';
import '../auth/api.dart';
import '../auth/loginApi.dart';
import 'register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    try {
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential;
    } catch (e) {
      print(e);
      return null;
    }
  }

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
                    'Welcome'.tr().toString(),
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
                                        child: Text('Go to Home'),
                                        onPressed: () {
                                          phoneController.text = "";
                                          passwordController.text = "";
                                          setState(() {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                              builder: (context) {
                                                return GenderSelectionScreen();
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
                            return RegisterScreen();
                          },
                        ));
                      });
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () async {
                  try {
                    final UserCredential? userCredential =
                        await signInWithGoogle();
                    if (userCredential != null) {
                      final displayName =
                          userCredential.user?.displayName ?? "";
                      final email = userCredential.user!.email;
                      final phoneNumber = userCredential.user!.phoneNumber;
                      print("GOO");
                      print(userCredential.user?.displayName.toString());
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return GoogleRegisterScreen(name: userCredential.user?.displayName.toString(),);
                        },
                      ));
                      // registerPatient(displayName, "AaaAA123456@@@@",
                      //     phoneNumber!, email!, "20");

                      //  print(displayName);
                      // Handle successful login
                      // You can navigate to the home screen or perform any other actions.
                    } else {
                      // Handle login failure
                      print("Login failed");
                    }
                  } catch (e) {
                    print("An error occurred during login: $e");
                    // Handle specific types of exceptions or show appropriate error messages
                  }
                },
                child: Container(
                  width: 50,
                  height: 50,
                  child: Image.asset("assets/google.png"),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
