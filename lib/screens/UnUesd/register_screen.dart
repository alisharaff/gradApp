// //import 'package:flutter/cupertino.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/resources/color_manager.dart';
// import 'Test_Page.dart';
// import 'components/my_textfield.dart';
// import 'components/my_button.dart';
// import 'components/square_tile.dart';
// import 'screens/Home/Test_Page.dart';

// class RegisterScreen extends StatefulWidget {
//   RegisterScreen({Key? key}) : super(key: key);

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   // text editing controllers
//   final usernameController = TextEditingController();

//   final emailController = TextEditingController();

//   final passwordController = TextEditingController();

//   final conPasswordController = TextEditingController();

//   final typeController = TextEditingController();

//   final ageController = TextEditingController();

//   bool _passwordVisible = false;

//   List <String>items =["Type".tr().toString(),"male".tr().toString(),"female".tr().toString()];

//   String?  selectItem = "Type".tr().toString(); 

//   // sign user in method
//   void signUserIn() {
//          setState(() {
//         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
//           return TestPage();
//         },));
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: ColorManager.white,elevation: 0,),
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: ListView(
//             children: [
//               // logo
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   // google button
//                   SquareTile(imagePath: 'assets/image-1.png'),
//                   SizedBox(width: 25),
//                 ],
//               ),

//               // Name textfield
//               MyTextField(
//                 controller: usernameController,
//                 hintText: 'Name'.tr().toString(),
//                 obscureText: false,
//               ),

//               const SizedBox(height: 15),

//               // Email textfield
//               MyTextField(
//                 controller: emailController,
//                 hintText: 'phone'.tr().toString(),
//                 obscureText: false,
//               ),

//               const SizedBox(height: 15),

//               // password textfield
//               MyPassTextField(
//                 controller: passwordController,
//                 hintText: 'Password'.tr().toString(),
//                 obscureText: true,
//               ),

//               const SizedBox(height: 15),

//               // con password textfield
//               MyPassTextField(
//                 controller: conPasswordController,
//                 hintText: 'ConfirmPassword'.tr().toString(),
//                 obscureText: true,
//               ),

//               const SizedBox(height: 15),

//               // Type textfield
//             Padding(
//              padding: const EdgeInsets.symmetric(horizontal: 25.0),
//              child:DropdownButtonFormField<String>(
//             hint:Text("Type".tr().toString(),style: TextStyle(color: Colors.grey),),
//             decoration: InputDecoration(enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(2.0),
//             borderSide: BorderSide(width: 1,color: Colors.grey))),
//             value: selectItem,items: items.map((e) => DropdownMenuItem<String>(value: e,child: Text(e,style: TextStyle(color: Colors.grey),))).toList(), onChanged: (ele){

//       }),
// ),
//               const SizedBox(height: 15),
//               // Age textfield
//               MyTextField(
//                 controller: ageController,
//                 hintText: 'Age'.tr().toString(),
//                 obscureText: false,
//               ),

//               const SizedBox(height: 15),

//               // sign in button
//               MyButton(
//                 onTap: signUserIn,
//               ),
//               const SizedBox(height: 50),  
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
