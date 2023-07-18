import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<List<Map<String, dynamic>>> GetResultToClickTestByPatientId(
    String id) async {
  final url =
      'http://parkinsonapi.somee.com/api/v2/Tests/GetResultToClickTestByPatientId?id=$id';
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImE4YjNiYTgzLThhYWUtNDk1YS1iYTM0LTA2Y2RmYjBkN2FkNSIsInJvbGUiOiJQYXRpZW50IiwibmJmIjoxNjg5MzM3NTY3LCJleHAiOjE2OTAyMDE1NjYsImlhdCI6MTY4OTMzNzU2N30.VqLAtK7DHsMKUxFCO3g8-M_FG0z0HikxEZzhdVxMvFo';

  SharedPreferences userData = await SharedPreferences.getInstance();
  token = userData.getString("token")!;
 
  final response = await http.get(
    Uri.parse(url),
    headers: {'accept': 'application/json', 'Authorization': 'Bearer $token'},
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data['success'] == true && data.containsKey('data')) {
      final innerData = data['data']['innerData'];
      final filteredData = List<Map<String, dynamic>>.from(innerData)
          .where((result) => result['patientId'] == int.parse(id))
          .toList();
      return filteredData;
    }
  }
  return [];
}
