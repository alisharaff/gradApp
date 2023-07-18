import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../components/square_tile.dart';



class DoctorRegisterScreen extends StatefulWidget {
  DoctorRegisterScreen({Key? key}) : super(key: key);

  @override
  State<DoctorRegisterScreen> createState() => _DoctorRegisterScreenState();
}

class _DoctorRegisterScreenState extends State<DoctorRegisterScreen> {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  List<String> items = [
    'Type',
    'Male',
    'Female',
  ];

  String? selectItem = 'Type';


Future<void> registerPatient(
  String name,
  String password,
  String phoneNumber,
  String userName,
  String dateOfBirth,
) async {
  final String baseUrl = 'http://parkinsonapi.somee.com/api/v2/Register/PatentRegister';
  final String url = '$baseUrl?Name=$name&DateOfBirth=$dateOfBirth&UserName=$userName&Password=$password&PhoneNumber=$phoneNumber';

  final response = await http.post(
    Uri.parse(url),
    headers: {'accept': '*/*'},
  );

  if (response.statusCode == 200) {
    // Registration successful
      SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);

    print('Registration successful');
    print(response.body);
  } else {
     SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);

    // Registration failed
    print('Registration failed');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 25),
              children: [
                // logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // google button
                    SquareTile(imagePath: 'assets/image-1.png'),
                    SizedBox(width: 25),
                  ],
                ),

                const SizedBox(height: 15),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone is required';
                    }
                    return null;
                  },
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: 'Phone',
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Username is required';
                    }
                    return null;
                  },
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  controller: passwordController,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                DropdownButtonFormField<String>(
                  value: selectItem,
                  hint: Text('Type'),
                  onChanged: (value) {
                    setState(() {
                      selectItem = value;
                    });
                  },
                  items: items.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Date of Birth is required';
                    }
                    return null;
                  },
                  controller: ageController,
                  decoration: InputDecoration(
                    hintText: 'Date of Birth',
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff4696a1))),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await registerPatient(
                        nameController.text,
                        passwordController.text,
                        phoneController.text,
                        usernameController.text,
                        ageController.text,
                      );

                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
                      Future.delayed(const Duration(seconds: 2), () {
                      if (isLoggedIn) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Your registration was successful'),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal,
                                  ),
                                  child: Text('OK'),
                                  onPressed: () {
                                    setState(() {
                                      nameController.text = '';
                                      usernameController.text = '';
                                      phoneController.text = '';
                                      passwordController.text = '';
                                      ageController.text = '';
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Your registration failed'),
                              content: Text('Please try again.'),
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
                      }});
                    } else {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool('isLoggedIn', false);
                    }
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
