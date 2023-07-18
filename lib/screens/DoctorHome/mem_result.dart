import 'package:flutter/material.dart';

import 'APiofTests/mem_Api.dart';

class MemoryTestResultsScreen extends StatefulWidget {
  final String id;

  MemoryTestResultsScreen({required this.id});

  @override
  _MemoryTestResultsScreenState createState() => _MemoryTestResultsScreenState();
}

class _MemoryTestResultsScreenState extends State<MemoryTestResultsScreen> {
  List<MemoryTestResult> results = [];

  @override
  void initState() {
    super.initState();
    fetchResults();
  }

  Future<void> fetchResults() async {
    final List<MemoryTestResult> fetchedResults = await fetchMemoryTestResults(widget.id);
    setState(() {
      results = fetchedResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memory Test Results'),
      ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final result = results[index];
          return ListTile(
            title: Text(
              'Test Result: ${result.result == 1 ? 'Success' : 'Failed'}',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 18,
                color: const Color(0xa6000000),
                fontWeight: FontWeight.w700,
                height: 1.5,
              ),
              textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
            ),
            subtitle: Text(
              'Added On: ${result.addedOn}',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
           
          );
        },
      ),
    );
  }
}
