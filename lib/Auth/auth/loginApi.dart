import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> login(String username, String password) async {
  final String url =
      'http://parkinsonapi.somee.com/api/v2/Login?UserName=$username&Password=$password';

  final response = await http
      .post(Uri.parse(url), headers: {'Content-Type': 'application/json'});

  print(response.statusCode);

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    final success = responseData['success'] ?? false;
    if (success) {
      final innerData = responseData['data']['innerData'];
      final token = innerData['token'];
      final id = innerData['user']['id'];

      final user = innerData['user']['name'];
      final dateOfBirth = innerData['user']['dateOfBirth'];
      final phoneNumber = innerData['user']['user']['phoneNumber'];
      // print(user.toString());
      // print(innerData.toString());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      SharedPreferences userData = await SharedPreferences.getInstance();
      Fluttertoast.showToast(
        msg: 'please wait...',
        toastLength: Toast
            .LENGTH_SHORT, // Duration: Toast.LENGTH_SHORT or Toast.LENGTH_LONG
        gravity: ToastGravity
            .BOTTOM, // ToastGravity.TOP, ToastGravity.CENTER, or ToastGravity.BOTTOM
        backgroundColor: Colors.red, // Background color of the toast
        textColor: Colors.white, // Text color of the toast
        fontSize: 16.0, // Font size of the toast message
      );
      prefs.setBool('isLoggedInS', true);
      userData.setString('token', token.toString());
      userData.setString('UserName', user.toString());
      userData.setString('dateOfBirth', dateOfBirth.toString());
      userData.setString('phoneNumber', phoneNumber.toString());
      userData.setString('id', id.toString());

      // Store token and user information if needed

      print('Success');
      print(innerData.toString());
    } else {
      print('Failure');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedInS', false);
    }
  } else {
    print('Failure');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedInS', false);
  }
}
