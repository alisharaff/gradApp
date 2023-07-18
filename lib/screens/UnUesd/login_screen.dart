// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'register_screen.dart';
// import 'screens/Home/Test_Page.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
// class _LoginScreenState extends State<LoginScreen> {


//    int currentpage = 0;
  
//  @override

  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 20,
//         ),
//         width: MediaQuery.of(context).size.width,
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             children: <Widget>[
//               const SizedBox(
//                 height: 150,
//               ),
//               Image.asset(
//                   'assets/login.jpg',
//                 width: 200,
//                 height: 200,
//               ),
//               Container(
//                   alignment: Alignment.center,
//                   padding: const EdgeInsets.all(15),
//                   child:  Text(
//                     'Welcome'.tr().toString(),
//                     style: TextStyle(fontSize: 20,
//                       color: Colors.grey,
//                     ),
//                   )),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'phone'.tr().toString(),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: const BorderSide(
//                       color: Colors.grey,
//                       width: 1.0,
//                     ),
//                   ),
//                   disabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: const BorderSide(
//                       color: Colors.grey,
//                       width: 1.0,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               TextFormField(
//                 keyboardType: TextInputType.visiblePassword ,
//                 obscureText: true, 
//                 decoration: InputDecoration(
//                   hintText: 'Password'.tr().toString(),
//                   suffixIcon: const Icon(Icons.remove_red_eye),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: const BorderSide(
//                       color: Colors.grey,
//                       width: 1.0,
//                     ),
//                   ),
//                   disabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: const BorderSide(
//                       color: Colors.grey,
//                       width: 1.0,
//                     ),
//                   ),
//                 ),
//               ),
//               GestureDetector(/// to make tap for anyThing
//                 onTap: (){
//                   print('Forget password ?');
//                 },
//                 child: Row( 
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                      Text('Forget'.tr().toString(),
//                     style: TextStyle(
//                       color: const Color(0xff4696a1),
//                       fontSize: 15,
//                     ),
//               ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 15.0),
//               Container(
//                 width: 250,
//                 child: MaterialButton(     
//                   elevation: 5.0,
//                     color: const Color(0xff4696a1),
//                     padding: EdgeInsets.symmetric(
//                       vertical: 15,          
//                       horizontal: 20,
//                     ),
//                     child: Text(
//                       'signin'.tr().toString(),
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 23,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     shape: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: BorderSide.none,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
//                           return TestPage();
//                         },));
//                       });
//                       /// Go TO Home
//                     }
//                     ),
//               ),
//               const SizedBox(height: 10,),
//               Row(
//                 children: <Widget>[
//                    Text('dontHave'.tr().toString()),
//                   TextButton(
//                     child:  Text(
//                       'Signup'.tr().toString(),
//                       style: TextStyle(fontSize: 20,
//                       color: const Color(0xff4696a1),
//                       ),
                      
//                     ),
//                     onPressed: () { // == ontap
//                       //signup screen
//                       setState(() {
//                         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
//                           return RegisterScreen();
//                         },));
//                       });
//                     },
//                   )
//                 ],
//                 mainAxisAlignment: MainAxisAlignment.center,
//               ),
  
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
