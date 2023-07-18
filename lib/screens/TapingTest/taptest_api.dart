import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void TapTestRequest(int patientId, int leftHand, int rightHand) async {
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImE4YjNiYTgzLThhYWUtNDk1YS1iYTM0LTA2Y2RmYjBkN2FkNSIsInJvbGUiOiJQYXRpZW50IiwibmJmIjoxNjg5MzM3NTY3LCJleHAiOjE2OTAyMDE1NjYsImlhdCI6MTY4OTMzNzU2N30.VqLAtK7DHsMKUxFCO3g8-M_FG0z0HikxEZzhdVxMvFo';

  SharedPreferences userData = await SharedPreferences.getInstance();
  token = userData.getString("token")!;
  print(token);

  final url =
      'http://parkinsonapi.somee.com/api/v2/Tests/AddResultToClickTestByPatientId';
  final headers = {
    'accept': 'text/plain',
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json-patch+json',
  };

  final body =
      '{"patientId": $patientId, "leftHand": $leftHand, "rightHand": $rightHand}';

  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    print('POST request successful');
  } else {
    print('POST request failed with status: ${response.statusCode}');
  }
}
