import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Home/videoYoU.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aerobic exercise'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoPlayerScreen(
                  videoLink: 'https://www.youtube.com/watch?v=h9NQc0LYrwE&feature=youtu.be',
                ),
              ),
            );
          },
          child: Text('Play Video'),
        ),
      ),
    );
  }
}