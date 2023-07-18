import 'package:flutter/material.dart';

import 'APiofTests/click_api.dart';

class ResultCircleScreen extends StatefulWidget {
  final String id;

  ResultCircleScreen({required this.id});

  @override
  _ResultCircleScreenState createState() => _ResultCircleScreenState();
}

class _ResultCircleScreenState extends State<ResultCircleScreen> {
  List<Map<String, dynamic>> results = [];

  @override
  void initState() {
    super.initState();
    GetResultToClickTestByPatientId(widget.id).then((data) {
      setState(() {
        results = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final result = results[index];
          return ListTile(
            title: Text('Time: ${result['id']}'),
            subtitle: Text('Left Hand: ${result['leftHand']}, Right Hand: ${result['rightHand']}'),
          );
        },
      ),
    );
  }
}
