

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final String url = 'http://parkinsonapi.somee.com/api/v2/Base/GetPatientByDoctorId?doctorId=1002';

    final Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjhjMzlhZDliLTE3MzAtNDMwMS04NjA5LTgwY2M4ODRhZTI1NiIsInJvbGUiOiJEb2N0b3IiLCJuYmYiOjE2ODk1NjA0MTUsImV4cCI6MTY5MDQyNDQxNSwiaWF0IjoxNjg5NTYwNDE1fQ.j8sfNDygC0Dxvlo-vy5GrjTUtcMbNGLksM-LlSB98To',
    };

    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData.containsKey('data') && responseData['data'].containsKey('innerData')) {
          final Map<String, dynamic> innerData = responseData['data']['innerData'];
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
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text('ID: ${user.id}'),
            trailing: Text('Doctor ID: ${user.doctorId}'),
          );
        },
      ),
    );
  }
}
