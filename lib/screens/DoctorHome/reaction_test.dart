import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReactionTestResult {
  final int id;
  final int patientId;
  final int result;
  final String addedOn;

  ReactionTestResult({
    required this.id,
    required this.patientId,
    required this.result,
    required this.addedOn,
  });
}

class ReactionTestScreen extends StatefulWidget {
  final String patientId;

  ReactionTestScreen({required this.patientId});

  @override
  _ReactionTestScreenState createState() => _ReactionTestScreenState();
}

class _ReactionTestScreenState extends State<ReactionTestScreen> {
  List<ReactionTestResult> results = [];

  @override
  void initState() {
    super.initState();
    fetchReactionTestResults();
  }

  Future<void> fetchReactionTestResults() async {
    final String url =
        'http://parkinsonapi.somee.com/api/v2/Tests/GetResultToReactionTestByPatientId?id=${widget.patientId}';

    final Map<String, String> headers = {
      'accept': 'text/plain',
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
          final List<dynamic> innerData = responseData['data']['innerData'];
          setState(() {
            results = innerData.map((data) {
              return ReactionTestResult(
                id: data['id'],
                patientId: data['patientId'],
                result: (data['result'] as double).toInt(),
                addedOn: data['addedOn'],
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Reaction Test Results'),
      ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final result = results[index];
          final resultText = result.result == 1 ? 'Success' : 'Failed';

          return ListTile(
            title: Text(
              'Result: $resultText',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Added On: ${result.addedOn}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}

