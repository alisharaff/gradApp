import 'package:http/http.dart' as http;

Future<void> addPatientToDoctor(String doctorId, String patientId) async {
  final String url = 'http://parkinsonapi.somee.com/api/v2/Base/AddPatientToDoctor';

  final Map<String, String> headers = {
    'accept': '*/*',
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImE4YjNiYTgzLThhYWUtNDk1YS1iYTM0LTA2Y2RmYjBkN2FkNSIsInJvbGUiOiJQYXRpZW50IiwibmJmIjoxNjg5MzM3NTY3LCJleHAiOjE2OTAyMDE1NjYsImlhdCI6MTY4OTMzNzU2N30.VqLAtK7DHsMKUxFCO3g8-M_FG0z0HikxEZzhdVxMvFo',
  };

  final response = await http.post(
    Uri.parse('$url?doctorId=$doctorId&patientId=$patientId'),
    headers: headers,
  );

  if (response.statusCode == 200) {
    print('Patient added to doctor successfully');
  } else {
    print('Failed to add patient to doctor');
  }
}
