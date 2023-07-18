import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
// Future<void> registerPatient(String name, String password, String phoneNumber, String userName, String dateOfBirth) async {
//   final String url = 'http://parkinsonapi.somee.com/api/v2/Register/PatentRegister';

//   final response = await http.post(
//     Uri.parse(url),
//     body: jsonEncode({
//       "Name": name,
//       "Password": password,
//       "PhoneNumber": phoneNumber,
//       "UserName": userName,
//       "DateOfBirth": dateOfBirth,
//     }),
//     headers: {'Content-Type': 'application/json'},
//   );

//   if (response.statusCode == 200) {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isLoggedIn', true);

//     // Registration successful
//     print('Success');
//     print(response.body.toString());
//   } else {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isLoggedIn', false);

//     // Registration failed
//     print('Failure');
//   }
// }
