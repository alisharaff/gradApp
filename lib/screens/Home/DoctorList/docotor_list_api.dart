import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> getDoctors() async {
  final String url = 'http://parkinsonapi.somee.com/api/v2/Base/GetDoctors';
String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImE4YjNiYTgzLThhYWUtNDk1YS1iYTM0LTA2Y2RmYjBkN2FkNSIsInJvbGUiOiJQYXRpZW50IiwibmJmIjoxNjg5MzM3NTY3LCJleHAiOjE2OTAyMDE1NjYsImlhdCI6MTY4OTMzNzU2N30.VqLAtK7DHsMKUxFCO3g8-M_FG0z0HikxEZzhdVxMvFo';

  SharedPreferences userData = await SharedPreferences.getInstance();
  token = userData.getString("token")!;
  print(token);

  final Map<String, String> headers = {
    'accept': '*/*',
    'Authorization': 'Bearer $token' };

  final response = await http.get(
    Uri.parse(url),
    headers: headers,
  );

  print(response.statusCode);
  if (response.statusCode == 200) {
    print('Success');
    print(response.body);
  } else {
    print('Failure');
  }
}
