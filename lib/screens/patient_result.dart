// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DoctorHome/APiofTests/click_api.dart';
import 'DoctorHome/click_test.dart';
import 'DoctorHome/mem_result.dart';
import 'DoctorHome/reaction_test.dart';

class PatientResult extends StatefulWidget {
  final String paId;
  final String doId;
  final String paName;
  PatientResult({
    Key? key,
    required this.paId,
    required this.doId,
    required this.paName,
  }) : super(key: key);

  @override
  State<PatientResult> createState() => _PatientResultState();
}

class _PatientResultState extends State<PatientResult> {
  String DoctorId = "0";
  Future<void> getId() async {
    SharedPreferences userData = await SharedPreferences.getInstance();
    setState(() {
      DoctorId = userData.getString("id")!;

      print(DoctorId);
    });
  }

  List<Map<String, dynamic>> results = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getId();
    GetResultToClickTestByPatientId(widget.paId).then((data) {
      setState(() {
        results = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: const Color(0xff4696a1),
          ),
        ),
        title: Row(
          children: [
            Text(
              'Patient Result',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 30,
                color: const Color(0xff4696a1),
                height: 1.0666666666666667,
                shadows: [
                  Shadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  )
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80.0,
              width: 400.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Text(
                        '  patient name : ${widget.paName}',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 18,
                          color: const Color(0xa6000000),
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 450.0,
              width: 400.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 3,
                  ),
                ],
              ),
              child: ListView(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),

                  SizedBox(
                    height: 5.0,
                  ),
                  ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    title: Text(
                      ' Finger test result',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 18,
                        color: const Color(0xa6000000),
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return ResultCircleScreen(id: widget.paId);
                        },
                      ));
                    },
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    title: Text(
                      ' Memory test result',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 18,
                        color: const Color(0xa6000000),
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return MemoryTestResultsScreen(
                            id: "1",
                          );
                        },
                      ));
                    },
                  ),

                  SizedBox(
                    height: 5.0,
                  ),
                  ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    title: Text(
                      ' Reaction time test result',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 18,
                        color: const Color(0xa6000000),
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return ReactionTestScreen(patientId: "1");
                        },
                      ));
                    },
                  ),

                  SizedBox(
                    height: 5.0,
                  ),
                  ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    title: Text(
                      ' Spiral test result',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 18,
                        color: const Color(0xa6000000),
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Fluttertoast.showToast(
                        msg: 'Comming Soon...',
                        toastLength: Toast
                            .LENGTH_SHORT, // Duration: Toast.LENGTH_SHORT or Toast.LENGTH_LONG
                        gravity: ToastGravity
                            .BOTTOM, // ToastGravity.TOP, ToastGravity.CENTER, or ToastGravity.BOTTOM
                        backgroundColor: Color.fromARGB(
                            255, 18, 173, 173), // Background color of the toast
                        textColor: Colors.white, // Text color of the toast
                        fontSize: 16.0, // Font size of the toast message
                      );
                    },
                  ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       '  Spiral test result : 10/15',
                  //       style: TextStyle(
                  //         fontFamily: 'Segoe UI',
                  //         fontSize: 18,
                  //         color: const Color(0xa6000000),
                  //         fontWeight: FontWeight.w700,
                  //         height: 1.5,
                  //       ),
                  //       textHeightBehavior:
                  //           TextHeightBehavior(applyHeightToFirstAscent: false),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
