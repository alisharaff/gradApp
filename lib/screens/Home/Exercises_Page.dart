import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Test_Page.dart';
import 'videoYoU.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({Key? key}) : super(key: key);

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  bool isTest = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage(
                'assets/user.png',
              ),
            ),
            SizedBox(
              width: 150.0,
              height: 21.0,
              child: Stack(
                children: <Widget>[
                  SizedBox.expand(
                      child: Text(
                    "Parkinson's Disease",
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 16,
                      color: const Color(0xff818788),
                      height: 2,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              width: 400.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: const Color(0xfff1f1f1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isTest = true;
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) {
                              return TestPage();
                            },
                          ));
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Tests',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 20,
                                color: const Color(0xff333030),
                                height: 1.6,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              textAlign: TextAlign.center,
                              softWrap: false,
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: isTest
                              ? const Color(0xff1c95a6)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.transparent,
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 42.0,
                    height: 27.0,
                    child: VerticalDivider(
                      color: Colors.grey,
                      thickness: 5,
                      indent: 0,
                      endIndent: 0,
                      width: 20,
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isTest = false;
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) {
                              return ExercisesPage();
                            },
                          ));
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Exercises',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 20,
                                color: const Color(0xff333030),
                                height: 1.6,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              textAlign: TextAlign.center,
                              softWrap: false,
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: isTest
                              ? Colors.transparent
                              : const Color(0xff1c95a6),
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.transparent,
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 72.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoPlayerScreen(
                              videoLink:
                                  'https://www.youtube.com/watch?v=h9NQc0LYrwE&feature=youtu.be',
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          // background:
                          Positioned.fill(
                            child: Container(
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
                            ),
                          ),
                          Positioned.fill(
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(24.0, 24.0, 252.0, 24.0),
                              child: Stack(
                                children: <Widget>[
                                  SizedBox.expand(
                                      child: Text(
                                    'Aerobic',
                                    style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 18,
                                      color: const Color(0xa6000000),
                                      fontWeight: FontWeight.w700,
                                      height: 1.5,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 29.0,
                  ),
                  SizedBox(
                    height: 72.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoPlayerScreen(
                              videoLink:
                                  'https://www.youtube.com/watch?v=Gh8cZ_W2vR4&feature=youtu.be',
                            ),
                          ),
                        );
                      },
                      child: GestureDetector(
                         onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoPlayerScreen(
                              videoLink:
                                  'https://www.youtube.com/watch?v=Gh8cZ_W2vR4&feature=youtu.be',
                            ),
                          ),
                        );
                      },
                        child: Stack(
                          children: [
                            // background:
                            Positioned.fill(
                              child: Container(
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
                              ),
                            ),
                            Positioned.fill(
                              child: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(24.0, 24.0, 252.0, 24.0),
                                child: Stack(
                                  children: <Widget>[
                                    SizedBox.expand(
                                        child: Text(
                                      'Strength',
                                      style: TextStyle(
                                        fontFamily: 'Segoe UI',
                                        fontSize: 18,
                                        color: const Color(0xa6000000),
                                        fontWeight: FontWeight.w700,
                                        height: 1.5,
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 29.0,
                  ),
                  SizedBox(
                    height: 72.0,
                    child: GestureDetector(
                       onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoPlayerScreen(
                              videoLink:
                                  'https://www.youtube.com/watch?v=mzmNrHRusxw&feature=youtu.be',
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                    // background:
                          Positioned.fill(
                            child: Container(
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
                            ),
                          ),
                          Positioned.fill(
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(24.0, 24.0, 252.0, 24.0),
                              child: Stack(
                                children: <Widget>[
                                  SizedBox.expand(
                                      child: Text(
                                    'Flexibility',
                                    style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 18,
                                      color: const Color(0xa6000000),
                                      fontWeight: FontWeight.w700,
                                      height: 1.5,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 29.0,
                  ),
                  SizedBox(
                    height: 72.0,
                    child: GestureDetector(
                       onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoPlayerScreen(
                              videoLink:
                                  'https://www.youtube.com/watch?v=uOljoOvycuo&feature=youtu.be',
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                    // background:
                          Positioned.fill(
                            child: Container(
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
                            ),
                          ),
                          Positioned.fill(
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(24.0, 24.0, 252.0, 24.0),
                              child: Stack(
                                children: <Widget>[
                                  SizedBox.expand(
                                      child: Text(
                                    'Balance and Agility',
                                    style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 18,
                                      color: const Color(0xa6000000),
                                      fontWeight: FontWeight.w700,
                                      height: 1.5,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 29.0,
                  ),
                  SizedBox(
                    height: 72.0,
                    child: GestureDetector(
                       onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoPlayerScreen(
                              videoLink:
                                  'https://www.youtube.com/watch?v=pamOsmXyA38&feature=youtu.be',
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                    // background:
                          Positioned.fill(
                            child: Container(
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
                            ),
                          ),
                          Positioned.fill(
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(24.0, 24.0, 252.0, 24.0),
                              child: Stack(
                                children: <Widget>[
                                  SizedBox.expand(
                                      child: Text(
                                    'Dance Training ',
                                    style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 18,
                                      color: const Color(0xa6000000),
                                      fontWeight: FontWeight.w700,
                                      height: 1.5,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 29.0,
                  ),
                  SizedBox(
                    height: 72.0,
                    child: GestureDetector(
                       onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoPlayerScreen(
                              videoLink:
                                  'https://www.youtube.com/watch?v=Ez2GeaMa4c8&feature=youtu.be',
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                    // background:
                          Positioned.fill(
                            child: Container(
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
                            ),
                          ),
                          Positioned.fill(
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(24.0, 24.0, 252.0, 24.0),
                              child: Stack(
                                children: <Widget>[
                                  SizedBox.expand(
                                      child: Text(
                                    'Hand Exercises',
                                    style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 18,
                                      color: const Color(0xa6000000),
                                      fontWeight: FontWeight.w700,
                                      height: 1.5,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
