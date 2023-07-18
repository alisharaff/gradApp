import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> addResultToReactionTestByPatientId(int patientId, int result) async {
  final String url = 'http://parkinsonapi.somee.com/api/v2/Tests/AddResultToReactionTestByPatientId';

  final Map<String, String> headers = {
    'accept': 'text/plain',
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImE4YjNiYTgzLThhYWUtNDk1YS1iYTM0LTA2Y2RmYjBkN2FkNSIsInJvbGUiOiJQYXRpZW50IiwibmJmIjoxNjg5MzM3NTY3LCJleHAiOjE2OTAyMDE1NjYsImlhdCI6MTY4OTMzNzU2N30.VqLAtK7DHsMKUxFCO3g8-M_FG0z0HikxEZzhdVxMvFo',
    'Content-Type': 'application/json-patch+json',
  };

  final Map<String, dynamic> requestBody = {
    'patientId': patientId,
    'result': result,
  };

  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode(requestBody),
  );

  print(response.statusCode);
  if (response.statusCode == 200) {
    print('Success');
    print(response.body);
  } else {
    print('Failure');
  }
}
