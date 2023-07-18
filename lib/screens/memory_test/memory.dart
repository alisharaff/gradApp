import 'dart:async';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../circle_test/circleScreen.dart';
import 'data.dart';
import 'memorytest_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

Random random = new Random();
var i = random.nextInt(5);
int result = 0;

class _HomeScreenState extends State<HomeScreen> {
  Game game = Game();

  List<int> nums = [0, 1, 2, 3, 4, 5];
  int _time = 5;
  void starttimer() {
    nums.shuffle();
    Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        if (_time >= 0) {
          print(_time);
          game.gameImg![nums[_time]] = game.cards_list[nums[_time]];
          _time--;
        } else if (_time == -1) {
          game.hiddenCardpath = game.cards_list[i];
          for (int c = 0; c < 6; c++) {
            game.gameImg![c] = game.gameImg1![c];
          }
          _time--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    game.initGame();
    starttimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 100, 119),
      appBar: AppBar(
        title: Text(
          "Memory Test".tr().toString(),
          style: const TextStyle(
              color: Colors.white, fontStyle: FontStyle.italic, fontSize: 25.0),
        ),
      ),
      body:
          //Padding(padding: const EdgeInsets.only(top: 50.0, ),

          Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/background_memory.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.24), BlendMode.dstIn),
          ),
        ),
        child: Column(
          children: [
            GestureDetector(
              //onTap:
              //starttimer,
              child: Container(
                margin: const EdgeInsets.only(
                    left: 90, right: 90, top: 50, bottom: 50),
                padding: const EdgeInsets.all(70),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  gradient: const RadialGradient(
                    center: Alignment(0.0, 0.0),
                    radius: 0.5,
                    colors: [
                      Color(0xc4489db4),
                      Color(0xc400c9ff),
                      Color(0xc4205867)
                    ],
                  ),
                  border:
                      Border.all(width: 4.0, color: const Color(0xffffffff)),
                  image: DecorationImage(
                    image: AssetImage(game.hiddenCardpath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 1),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            game.matchCheck
                                .add({index: game.cards_list[index]});

                            if (game.matchCheck.length == 2) {
                              if (game.matchCheck[0].values.first ==
                                  game.matchCheck[1].values.first) {
                                result++;
                                MemortTestRequest(1, 1);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 11, 175, 66),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(6),
                                        )),
                                    child: const Text("Correct , Good Job"),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                ));

                                game.matchCheck.clear();
                              } else {
                                MemortTestRequest(1, 0);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 212, 20, 20),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(6),
                                        )),
                                    child: const Text(" Wrong , OOPs"),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                ));
                                game.matchCheck.clear();
                              }
                            }
                          });
                          setState(() {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) {
                                return CircleScreen();
                              },
                            ));
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          height: 100,
                          width: 100,
                          //padding: EdgeInsets.all(30.0),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 10, 70, 126),
                            borderRadius: BorderRadius.circular(8.0),
                            gradient: const RadialGradient(
                              center: Alignment(0.0, 0.0),
                              radius: 0.5,
                              colors: [
                                Color(0xc4489db4),
                                Color.fromARGB(196, 47, 105, 121),
                                Color(0xc4205867)
                              ],
                            ),
                            border: Border.all(
                                width: 4.0, color: const Color(0xffffffff)),
                            image: DecorationImage(
                              image: AssetImage(game.gameImg![index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ));
                  }),
            ),
            // SizedBox(
            //   height: 20.0,
            // ),
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Color.fromARGB(255, 5, 39, 66),
            //     ),
            //     onPressed: () {
            //       setState(() {
            //         Navigator.of(context).pushReplacement(MaterialPageRoute(
            //           builder: (context) {
            //             return CircleScreen();
            //           },
            //         ));
            //       });
            //     },
            //     child: Text("Next"))
          ],
        ),
      ),
    );
  }
}
