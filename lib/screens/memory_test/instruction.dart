import 'package:flutter/material.dart';

import 'memory.dart';

class MyMemoryPage extends StatefulWidget {
  @override
  _MyMemoryPageState createState() => _MyMemoryPageState();
}

class _MyMemoryPageState extends State<MyMemoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            var router = new MaterialPageRoute(
                builder: (BuildContext context) => HomeScreen());
            Navigator.of(context).push(router);
          },
          label: const Text(
            "START",
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 31,
              color: Color(0xfff5f5f5),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 6, 50, 87),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Stack(
          children: [
            Positioned(
                child: Column(
              children: [
                Container(
                  height: 250,
                  //width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(100)),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 8, 87, 151),
                            Color.fromARGB(255, 2, 64, 117),
                            Color.fromARGB(255, 2, 30, 53),
                          ])),
                ),
              ],
            )),
            const Positioned(
                top: 50,
                left: 50,
                right: 10,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    left: 30,
                  ),
                  child: Text(
                    "Memory Test",
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(
                top: 300,
                left: 0,
              ),
              child: Container(
                  height: 390,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/amnesia.jpg'),
                      opacity: 50,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  )),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  top: 240,
                  left: 50.0,
                ),
                child: Container(
                  height: 150,
                  width: 350,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        offset: Offset(3, 3),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'instructions',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 24,
                              color: Color(0xff146c94),
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.notifications),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,),
                        child: Text(
                            'choose the box that has the same pattern in Top Box.',
                            style: TextStyle(
                              fontSize: 19,
                            )),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                )),
          ],
        ));
  }
}
