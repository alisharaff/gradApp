
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/screens/tapping_speed.dart';

// class TestPage extends StatefulWidget {
//   const TestPage({Key? key}) : super(key: key);

//   @override
//   State<TestPage> createState() => _TestPageState();
// }

// class _TestPageState extends State<TestPage> {
//   bool isTest = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffffffff),
//       appBar:AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//         title: Row(

//           children: [
//             CircleAvatar(
//               radius: 20.0,
//               backgroundImage: AssetImage(
//                 'assets/images/profile.png',
//               ),
//             ),
//             SizedBox(
//               width: 96.0,
//               height: 21.0,
//               child: Stack(
//                 children: <Widget>[
//                   SizedBox.expand(
//                       child: Text(
//                         'Patient Name',
//                         style: TextStyle(
//                           fontFamily: 'Segoe UI',
//                           fontSize: 16,
//                           color: const Color(0xff818788),
//                           height: 2,
//                         ),
//                         textHeightBehavior: TextHeightBehavior(
//                             applyHeightToFirstAscent: false),
//                         textAlign: TextAlign.center,
//                         softWrap: false,
//                       )),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(40.0),
//             child: Container(
//               width: 400.0,
//               height:50.0,
//               decoration: BoxDecoration(
//                 color: const Color(0xfff1f1f1),
//                 borderRadius: BorderRadius.circular(8.0),

//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: (){
//                         setState(() {
//                           isTest = true;
//                         });
//                       },
//                       child: Container(
//                         child: Column(

//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Tests',
//                               style: TextStyle(
//                                 fontFamily: 'Segoe UI',
//                                 fontSize: 20,
//                                 color: const Color(0xff333030),
//                                 height: 1.6,
//                               ),
//                               textHeightBehavior: TextHeightBehavior(
//                                   applyHeightToFirstAscent: false),
//                               textAlign: TextAlign.center,
//                               softWrap: false,
//                             ),
//                           ],
//                         ),
//                         decoration: BoxDecoration(
//                           color:isTest? const Color(0xff1c95a6) :  Colors.transparent,
//                           borderRadius: BorderRadius.circular(8.0),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.transparent,
//                               offset: Offset(0, 3),
//                               blurRadius: 6,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 42.0,
//                     height: 27.0,
//                     child:VerticalDivider(

//                       color: Colors.grey,
//                       thickness: 5,
//                       indent: 0,
//                       endIndent: 0,
//                       width: 20,
//                     ),
//                   ),
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: (){
//                         setState(() {
//                           isTest = false;
//                         });
//                       },
//                       child: Container(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Exercises',
//                               style: TextStyle(
//                                 fontFamily: 'Segoe UI',
//                                 fontSize: 20,
//                                 color: const Color(0xff333030),
//                                 height: 1.6,
//                               ),
//                               textHeightBehavior: TextHeightBehavior(
//                                   applyHeightToFirstAscent: false),
//                               textAlign: TextAlign.center,
//                               softWrap: false,
//                             ),
//                           ],

//                         ),
//                         decoration: BoxDecoration(
//                           color: isTest?   Colors.transparent : const Color(0xff1c95a6),
//                           borderRadius: BorderRadius.circular(8.0),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.transparent ,
//                               offset: Offset(0, 3),
//                               blurRadius: 6,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),

//                 ],


//               ),
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               SizedBox(
//                 height: 72.0,
//                 child: Stack(
//                   children: [
// // background:
//                     Positioned.fill(
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: const Color(0xffffffff),
//                           borderRadius: BorderRadius.circular(4.0),
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color(0x29000000),
//                               offset: Offset(0, 3),
//                               blurRadius: 3,
//                             ),
                          
//                           ],
//                         ),
//                       ),
//                     ),
//                     ///
                    
//               GestureDetector(
//                       onTap: () {
//               setState(() {
//                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//                  return TappingSpeed();
//         },));
//       });
//                       },
//                       child: Positioned.fill(
//                         child: Padding(
//                           padding: EdgeInsets.fromLTRB(24.0, 24.0, 219.0, 24.0),
//                           child: Stack(
//                             children: <Widget>[
//                               SizedBox.expand(
//                                   child: Text(
//                                     'Finger tapping',
//                                     style: TextStyle(
//                                       fontFamily: 'Segoe UI',
//                                       fontSize: 18,
//                                       color: const Color(0xa6000000),
//                                       fontWeight: FontWeight.w700,
//                                       height: 1.5,
//                                     ),
//                                     textHeightBehavior: TextHeightBehavior(
//                                         applyHeightToFirstAscent: false),
//                                   )
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 29.0,
//               ),
//               SizedBox(
//                 height: 72.0,
//                 child: Stack(
//                   children: [
// // background:
//                     Positioned.fill(
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: const Color(0xffffffff),
//                           borderRadius: BorderRadius.circular(4.0),
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color(0x29000000),
//                               offset: Offset(0, 3),
//                               blurRadius: 3,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Positioned.fill(
//                       child: Padding(
//                         padding: EdgeInsets.fromLTRB(24.0, 24.0, 252.0, 24.0),
//                         child: Stack(
//                           children: <Widget>[
//                             SizedBox.expand(
//                                 child: Text(
//                                   'Memory test',
//                                   style: TextStyle(
//                                     fontFamily: 'Segoe UI',
//                                     fontSize: 18,
//                                     color: const Color(0xa6000000),
//                                     fontWeight: FontWeight.w700,
//                                     height: 1.5,
//                                   ),
//                                   textHeightBehavior: TextHeightBehavior(
//                                       applyHeightToFirstAscent: false),
//                                 )),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 29.0,
//               ),
//               SizedBox(
//                 height: 72.0,
//                 child: Stack(
//                   children: [
// // background:
//                     Positioned.fill(
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: const Color(0xffffffff),
//                           borderRadius: BorderRadius.circular(4.0),
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color(0x29000000),
//                               offset: Offset(0, 3),
//                               blurRadius: 3,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Positioned.fill(
//                       child: Padding(
//                         padding: EdgeInsets.fromLTRB(24.0, 24.0, 252.0, 24.0),
//                         child: Stack(
//                           children: <Widget>[
//                             SizedBox.expand(
//                                 child: Text(
//                                   'Reaction test',
//                                   style: TextStyle(
//                                     fontFamily: 'Segoe UI',
//                                     fontSize: 18,
//                                     color: const Color(0xa6000000),
//                                     fontWeight: FontWeight.w700,
//                                     height: 1.5,
//                                   ),
//                                   textHeightBehavior: TextHeightBehavior(
//                                       applyHeightToFirstAscent: false),
//                                 )),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 29.0,
//               ),
//               SizedBox(
//                 height: 72.0,
//                 child: Stack(
//                   children: [
// // background:
//                     Positioned.fill(
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: const Color(0xffffffff),
//                           borderRadius: BorderRadius.circular(4.0),
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color(0x29000000),
//                               offset: Offset(0, 3),
//                               blurRadius: 3,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Positioned.fill(
//                       child: Padding(
//                         padding: EdgeInsets.fromLTRB(24.0, 24.0, 252.0, 24.0),
//                         child: Stack(
//                           children: <Widget>[
//                             SizedBox.expand(
//                                 child: Text(
//                                   'Spiral test',
//                                   style: TextStyle(
//                                     fontFamily: 'Segoe UI',
//                                     fontSize: 18,
//                                     color: const Color(0xa6000000),
//                                     fontWeight: FontWeight.w700,
//                                     height: 1.5,
//                                   ),
//                                   textHeightBehavior: TextHeightBehavior(
//                                       applyHeightToFirstAscent: false),
//                                 )),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 29.0,
//               ),
//               SizedBox(
//                 height: 72.0,
//                 child: Stack(
//                   children: [
// // background:
//                     Positioned.fill(
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: const Color(0xffffffff),
//                           borderRadius: BorderRadius.circular(4.0),
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color(0x29000000),
//                               offset: Offset(0, 3),
//                               blurRadius: 3,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Positioned.fill(
//                       child: Padding(
//                         padding: EdgeInsets.fromLTRB(24.0, 24.0, 252.0, 24.0),
//                         child: Stack(
//                           children: <Widget>[
//                             SizedBox.expand(
//                                 child: Text(
//                                   'Speech test',
//                                   style: TextStyle(
//                                     fontFamily: 'Segoe UI',
//                                     fontSize: 18,
//                                     color: const Color(0xa6000000),
//                                     fontWeight: FontWeight.w700,
//                                     height: 1.5,
//                                   ),
//                                   textHeightBehavior: TextHeightBehavior(
//                                       applyHeightToFirstAscent: false),
//                                 )),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),


//         ],
//       ),

//     );
//   }


// }
