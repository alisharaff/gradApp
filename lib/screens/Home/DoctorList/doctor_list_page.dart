import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../QR/scann.dart';

class Doctor {
  final int id;
  final String name;
  final DateTime dateOfBirth;
  final String userId;

  Doctor({
    required this.id,
    required this.name,
    required this.dateOfBirth,
    required this.userId,
  });
}

class DoctorListScreen extends StatefulWidget {
  @override
  _DoctorListScreenState createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  List<Doctor> doctors = [];

  @override
  void initState() {
    super.initState();
    fetchDoctors();
  }

  Future<void> fetchDoctors() async {
    final String url = 'http://parkinsonapi.somee.com/api/v2/Base/GetDoctors';
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImE4YjNiYTgzLThhYWUtNDk1YS1iYTM0LTA2Y2RmYjBkN2FkNSIsInJvbGUiOiJQYXRpZW50IiwibmJmIjoxNjg5MzM3NTY3LCJleHAiOjE2OTAyMDE1NjYsImlhdCI6MTY4OTMzNzU2N30.VqLAtK7DHsMKUxFCO3g8-M_FG0z0HikxEZzhdVxMvFo';

    SharedPreferences userData = await SharedPreferences.getInstance();
    token = userData.getString("token")!;
    print(token);

    final Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer $token'
    };

    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData.containsKey('data')) {
          final List<dynamic> doctorsData = responseData['data']['innerData'];
          setState(() {
            doctors = doctorsData.map((data) {
              return Doctor(
                id: data['id'],
                name: data['name'],
                dateOfBirth: DateTime.parse(data['dateOfBirth']),
                userId: data['userId'],
              );
            }).toList();
          });
        }
      } catch (e) {
        print('Error parsing response: $e');
      }
    } else {
      print('Failure');
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage(
                'assets/user.png',
              ),
            ),
            SizedBox(
              width: 150.0,
              height: 21.0,
              child: Stack(
                children: <Widget>[
                  SizedBox.expand(
                      child: Text(
                    'Conect with Doctor',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 16,
                      color: const Color(0xff818788),
                      height: 2,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return scanner();
                  },
                ));
              });
            },
            child: ListTile(
              title: Text(doctor.name),
              subtitle: Text(
                  'Date of Birth: ${formatter.format(doctor.dateOfBirth)}'),
            ),
          );
        },
      ),
    );
  }
}
