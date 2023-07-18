import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Home/Test_Page.dart';
import 'dart:math';

import 'cilcletest_api.dart';

class CircleScreen extends StatefulWidget {
  const CircleScreen({Key? key}) : super(key: key);

  @override
  State<CircleScreen> createState() => _CircleScreenState();
}

class _CircleScreenState extends State<CircleScreen> {
  int _randomNumber = 1;
  Color activeColor = Colors.black;
  Color selcetColor = Colors.black;
  int onCLicked = 0;
  late Timer _timer;
  int _counter = 0;
  void _generateRandomNumber() {
    setState(() {
      _randomNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: const Text(
          "Reaction Time",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        const Center(
            child: Text(
          "tap the circle that will fill with BLACK",
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        )),
        const SizedBox(
          height: 25,
        ),
        // one == 1
        CircleAvatar(
          backgroundColor: Color.fromARGB(255, 231, 69, 69),
          radius: 50,
          child: CircleAvatar(
            radius: 40,
            backgroundColor: _randomNumber == 1 ? activeColor : Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                backgroundColor: Color.fromARGB(255, 231, 69, 69),
                radius: 50,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor:
                      _randomNumber == 2 ? activeColor : Colors.white,
                )),
            const SizedBox(
              width: 80,
            ),
            CircleAvatar(
                backgroundColor: Color.fromARGB(255, 231, 69, 69),
                radius: 50,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor:
                      _randomNumber == 3 ? activeColor : Colors.white,
                ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                backgroundColor: Color.fromARGB(255, 231, 69, 69),
                radius: 50,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor:
                      _randomNumber == 4 ? activeColor : Colors.white,
                )),
            const SizedBox(
              width: 80,
            ),
            CircleAvatar(
                backgroundColor: Color.fromARGB(255, 231, 69, 69),
                radius: 50,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor:
                      _randomNumber == 5 ? activeColor : Colors.white,
                ))
          ],
        ),
        GestureDetector(
          onTap: () {
            _timer = Timer.periodic(Duration(seconds: 1), (timer) {
              _generateRandomNumber();
              setState(() {
                _counter++;
                print('counter Is $_counter');
                if (_counter == 6) {
                  _timer.cancel();
                  print("cancel XX");
                  print(_randomNumber);
                  //

                  // Create a dialog box
                  const duration = Duration(seconds: 1);
                  _timer = Timer(duration, () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(builder: (context, setState) {
                          return AlertDialog(
                            title: Text("Select Black circle"),
                            content: Container(
                              height: MediaQuery.of(context).size.height / 2,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // one == 1
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          onCLicked = 1;
                                        });
                                      },
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Color.fromARGB(255, 231, 69, 69),
                                        radius: 40,
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundColor: onCLicked == 1
                                              ? selcetColor
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              onCLicked = 2;
                                              print("hhhhhhhhhhhhhhhh");
                                            });
                                          },
                                          child: CircleAvatar(
                                              backgroundColor: Color.fromARGB(
                                                  255, 231, 69, 69),
                                              radius: 40,
                                              child: CircleAvatar(
                                                radius: 30,
                                                backgroundColor: onCLicked == 2
                                                    ? selcetColor
                                                    : Colors.white,
                                              )),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              onCLicked = 3;
                                            });
                                          },
                                          child: CircleAvatar(
                                              backgroundColor: Color.fromARGB(
                                                  255, 231, 69, 69),
                                              radius: 40,
                                              child: CircleAvatar(
                                                radius: 30,
                                                backgroundColor: onCLicked == 3
                                                    ? selcetColor
                                                    : Colors.white,
                                              )),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              onCLicked = 4;
                                            });
                                          },
                                          child: CircleAvatar(
                                              backgroundColor: Color.fromARGB(
                                                  255, 231, 69, 69),
                                              radius: 40,
                                              child: CircleAvatar(
                                                radius: 30,
                                                backgroundColor: onCLicked == 4
                                                    ? selcetColor
                                                    : Colors.white,
                                              )),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              onCLicked = 5;
                                            });
                                          },
                                          child: CircleAvatar(
                                              backgroundColor: Color.fromARGB(
                                                  255, 231, 69, 69),
                                              radius: 40,
                                              child: CircleAvatar(
                                                radius: 30,
                                                backgroundColor: onCLicked == 5
                                                    ? selcetColor
                                                    : Colors.white,
                                              )),
                                        )
                                      ],
                                    ),
                                  ]),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.teal, // Background color
                                ),
                                child: Text("Confirm my select"),
                                onPressed: () {
                                  if (onCLicked == _randomNumber) {
                                    print("succ");
                                    // Navigator.of(context).pop();
                                    // Create a dialog box
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Your Resualt"),
                                          content: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.check_circle,
                                                  size: 40,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text("Your result is correct"),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors
                                                    .teal, // Background color
                                              ),
                                              child: Text("OK"),
                                              onPressed: () {
                                                addResultToReactionTestByPatientId(
                                                    1, 1);
                                                setState(() {
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                    builder: (context) {
                                                      return TestPage();
                                                    },
                                                  ));
                                                });
                                                _randomNumber = 1;
                                                _counter = 0;
                                                onCLicked = 0;
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    print("no try ag");

                                    // _randomNumber = 1;
                                    // _counter = 0;
                                    // onCLicked = 0;

                                    // Create a dialog box
                                    setState(
                                      () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Your Resualt"),
                                              content: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    2,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.cancel,
                                                      size: 40,
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                        "Your result is wrong"),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: Colors
                                                        .teal, // Background color
                                                  ),
                                                  child: Text("OK"),
                                                  onPressed: () {
                                                    addResultToReactionTestByPatientId(
                                                        1, 0);

                                                    setState(() {
                                                      Navigator.of(context)
                                                          .pushReplacement(
                                                              MaterialPageRoute(
                                                        builder: (context) {
                                                          return TestPage();
                                                        },
                                                      ));
                                                    });
                                                    _randomNumber = 1;
                                                    _counter = 0;
                                                    onCLicked = 0;
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    );
                                  }
                                },
                              ),
                            ],
                          );
                        });
                      },
                    );
                  });
                }
              });
            });
          },
          child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 231, 69, 69),
              radius: 50,
              child: CircleAvatar(
                child: Text("5 SEC"),
                radius: 40,
                backgroundColor: Colors.amber,
              )),
        ),
      ]),
    );
  }
}
