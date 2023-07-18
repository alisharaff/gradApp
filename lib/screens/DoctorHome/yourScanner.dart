import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ReslutScann extends StatefulWidget {
  const ReslutScann({Key? key}) : super(key: key);

  @override
  State<ReslutScann> createState() => _ReslutScannState();
}

class _ReslutScannState extends State<ReslutScann> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.teal),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "YourQRcode".tr().toString(),
          style: TextStyle(color: Colors.teal),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "WaitingforScan...".tr().toString(),
            style: TextStyle(color: Colors.teal),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/scann.png"),
          ),
          Center(child: Text("your QR code is private .if you ")),
          Center(child: Text("share it with someone they can scan it "))
        ]),
      ),
    );
  }
}
