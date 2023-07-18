import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class MemoryTestResult {
  final int id;
  final int patientId;
  final int result;
  final String addedOn;

  MemoryTestResult({
    required this.id,
    required this.patientId,
    required this.result,
    required this.addedOn,
  });
}

Future<List<MemoryTestResult>> fetchMemoryTestResults(String id) async {
  final String url =
      'http://parkinsonapi.somee.com/api/v2/Tests/GetResultToMemoryTestByPatientId?id=$id';
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImE4YjNiYTgzLThhYWUtNDk1YS1iYTM0LTA2Y2RmYjBkN2FkNSIsInJvbGUiOiJQYXRpZW50IiwibmJmIjoxNjg5MzM3NTY3LCJleHAiOjE2OTAyMDE1NjYsImlhdCI6MTY4OTMzNzU2N30.VqLAtK7DHsMKUxFCO3g8-M_FG0z0HikxEZzhdVxMvFo';

  SharedPreferences userData = await SharedPreferences.getInstance();
  token = userData.getString("token")!;

  final Map<String, String> headers = {
    'accept': 'text/plain',
    'Authorization': 'Bearer $token'
  };

  final response = await http.get(Uri.parse(url), headers: headers);

  if (response.statusCode == 200) {
    try {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('data') &&
          responseData['data'].containsKey('innerData')) {
        final List<dynamic> innerData = responseData['data']['innerData'];
        return innerData.map((data) {
          return MemoryTestResult(
            id: data['id'],
            patientId: data['patientId'],
            result: (data['result'] as double).toInt(), // Cast to int
            addedOn: data['addedOn'],
          );
        }).toList();
      }
    } catch (e) {
      print('Error parsing response: $e');
    }
  } else {
    print('Failure');
  }

  return [];
}
