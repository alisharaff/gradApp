import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../QR/qr_doctor.dart';
import '../patient_result.dart';
import 'yourScanner.dart';

class User {
  final int id;
  final String name;
  final DateTime dateOfBirth;
  final String userId;
  final int doctorId;

  User({
    required this.id,
    required this.name,
    required this.dateOfBirth,
    required this.userId,
    required this.doctorId,
  });
}

class DoctorPage extends StatefulWidget {
  const DoctorPage({Key? key}) : super(key: key);

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  String UserName = 'Doctor Name';
  String DoctorId = "0";
  Future<void> getName() async {
    SharedPreferences userData = await SharedPreferences.getInstance();
    setState(() {
      UserName = userData.getString("UserName")!;
      DoctorId = userData.getString("id")!;

      print(UserName);
      print(DoctorId);
    });
  }

  List<User> users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getName();
    startTimer();

    fetchUsers(DoctorId);
  }

  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const duration = Duration(seconds: 7);
    _timer = Timer.periodic(duration, (_) {
      fetchUsers(DoctorId);
    });
  }

  Future<void> fetchUsers(String id) async {
    final String url =
        'http://parkinsonapi.somee.com/api/v2/Base/GetPatientByDoctorId?doctorId=${id}';

    final Map<String, String> headers = {
      'accept': '*/*',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjhjMzlhZDliLTE3MzAtNDMwMS04NjA5LTgwY2M4ODRhZTI1NiIsInJvbGUiOiJEb2N0b3IiLCJuYmYiOjE2ODk1NjA0MTUsImV4cCI6MTY5MDQyNDQxNSwiaWF0IjoxNjg5NTYwNDE1fQ.j8sfNDygC0Dxvlo-vy5GrjTUtcMbNGLksM-LlSB98To',
    };

    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData.containsKey('data') &&
            responseData['data'].containsKey('innerData')) {
          final Map<String, dynamic> innerData =
              responseData['data']['innerData'];
          setState(() {
            users = [
              User(
                id: innerData['id'],
                name: innerData['name'],
                dateOfBirth: DateTime.parse(innerData['dateOfBirth']),
                userId: innerData['userId'],
                doctorId: innerData['doctorId'],
              ),
            ];
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
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff1c95a6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr/ ${UserName}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    CircleAvatar(
                      radius: 35.0,
                      backgroundImage: AssetImage(
                        'assets/user.png',
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Text('My QR'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return QRScreen(id: DoctorId,);
                    },
                  ));
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.teal[400],
          elevation: 0.0,
        ),
        body: users.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    title: Text(
                      'Patient Name: ${user.name}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ID: ${user.id}',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Doctor ID: ${user.doctorId}',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return PatientResult(
                            paId: user.id.toString(),
                            doId:user.doctorId.toString() ,
                            paName: user.name.toString()
                          );
                        },
                      ));
                    },
                  );
                },
              ));
  }
}
