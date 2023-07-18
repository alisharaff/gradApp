import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/memory_test/instruction.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../resources/color_manager.dart';
import 'taptest_api.dart';

class TappingSpeedRight extends StatefulWidget {
  const TappingSpeedRight({Key? key}) : super(key: key);

  @override
  State<TappingSpeedRight> createState() => _TappingSpeedRightState();
}

class _TappingSpeedRightState extends State<TappingSpeedRight> {
  Future<int> loadCounter() async {
    SharedPreferences userTests = await SharedPreferences.getInstance();
    print(userTests.getInt('TapLeftCounter'));
    print(userTests.getInt('TapRightCounter'));
    int tapLift = userTests.getInt('TapLeftCounter') ?? 0;
    int tapRight = userTests.getInt('TapLeftCounter') ?? 0;

    TapTestRequest(1, tapLift, tapRight);
    return userTests.getInt('TapLeftCounter') ?? 0;
  }

  Future<void> SetTestCounter(int counter) async {
    SharedPreferences userTests = await SharedPreferences.getInstance();
    await userTests.setInt('TapRightCounter', counter);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  var count = 0;
  int counter = 0;
  late Timer timerTap;
  var timerTapLabel = "";
  bool isButtonDisabled = false;
  bool isTimerRunning = false;
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FingerTap".tr().toString(),
          style: TextStyle(
              color: ColorManager.whiteColor,
              fontStyle: FontStyle.italic,
              fontSize: 25.0),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height * 0.07,
          ),
          Center(
            child: Text(
              "Tap the Buttons using \n     your Right hand".tr().toString(),
              style: TextStyle(fontSize: 27.0, color: ColorManager.grayColor),
            ),
          ),
          SizedBox(
            height: height * 0.07,
          ),
          Center(
            child: Text(
              "Timer $counter",
              style: TextStyle(fontSize: 30),
            ),
          ),
          SizedBox(
            height: height * 0.07,
          ),
          Center(
            child: Text(
              "Total Taps".tr().toString(),
              style: TextStyle(fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "$count",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: isButtonDisabled
                    ? null
                    : () {
                        if (isTimerRunning) {
                          setState(() {
                            count++;
                          });
                        } else {
                          print("open timerrrr");
                          setState(() {
                            Fluttertoast.showToast(
                              msg: 'Start timer first please',
                              toastLength: Toast
                                  .LENGTH_SHORT, // Duration: Toast.LENGTH_SHORT or Toast.LENGTH_LONG
                              gravity: ToastGravity
                                  .BOTTOM, // ToastGravity.TOP, ToastGravity.CENTER, or ToastGravity.BOTTOM
                              backgroundColor:
                                  Colors.red, // Background color of the toast
                              textColor:
                                  Colors.white, // Text color of the toast
                              fontSize: 16.0, // Font size of the toast message
                            );
                          });
                        }
                      },
                child: Container(
                  width: 130,
                  height: 130,
                  margin: EdgeInsets.only(top: 70, left: 20, right: 20),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                        color: ColorManager.circleColor,
                        style: BorderStyle.solid,
                      ),
                      shape: BoxShape.circle),
                  child: Center(
                      child: Text(
                    "TAP".tr().toString(),
                    style: TextStyle(fontSize: 50.0),
                  )),
                ),
              ),
              GestureDetector(
                onTap: isButtonDisabled
                    ? null
                    : () {
                        if (isTimerRunning) {
                          setState(() {
                            count++;
                          });
                        } else {
                          print("open timerrrr");
                          setState(() {
                            Fluttertoast.showToast(
                              msg: 'Start timer first please',
                              toastLength: Toast
                                  .LENGTH_SHORT, // Duration: Toast.LENGTH_SHORT or Toast.LENGTH_LONG
                              gravity: ToastGravity
                                  .BOTTOM, // ToastGravity.TOP, ToastGravity.CENTER, or ToastGravity.BOTTOM
                              backgroundColor:
                                  Colors.red, // Background color of the toast
                              textColor:
                                  Colors.white, // Text color of the toast
                              fontSize: 16.0, // Font size of the toast message
                            );
                          });
                        }
                      },
                child: Container(
                  width: 130,
                  height: 130,
                  margin: EdgeInsets.only(top: 70, left: 20, right: 20),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                        color: ColorManager.circleColor,
                        style: BorderStyle.solid,
                      ),
                      shape: BoxShape.circle),
                  child: Center(
                      child: Text(
                    "TAP".tr().toString(),
                    style: TextStyle(fontSize: 50.0),
                  )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            width: 100, // Adjust the size as needed
            height: 100, // Adjust the size as needed
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 64, 152, 167)),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: CircleBorder(),
                backgroundColor: Colors.transparent,
              ),
              onPressed: () {
                // Button onPressed logic
                // Start the timer
                Timer.periodic(Duration(seconds: 1), (Timer timer) {
                  setState(() {
                    if (counter < 20) {
                      counter++;
                    } else {
                      timer.cancel(); // Cancel the timer after 20 seconds
                      isButtonDisabled = true; // Disable the button
                      SetTestCounter(count);
                      // Create a dialog box
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Your Resualt"),
                            content: Container(
                              height: MediaQuery.of(context).size.height / 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    size: 100,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Your result iS $count"),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.teal, // Background color
                                ),
                                // Go TO TappingSpeedRight
                                child: Text("Go To Next Test"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  counter = 0;
                                  count = 0;
                                  loadCounter();
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) {
                                      return MyMemoryPage();
                                    },
                                  ));
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  });
                });

                setState(() {
                  isTimerRunning = true;
                });
              },
              child: Text(
                'Timer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
