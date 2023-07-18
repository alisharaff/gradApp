import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Auth/ask_login.dart';
import 'package:flutter_application_1/resources/color_manager.dart';
import 'package:flutter_application_1/screens/DoctorHome/test.dart';
import 'package:flutter_application_1/screens/Home/Exercises_Page.dart';
import 'package:flutter_application_1/screens/Home/Test_Page.dart';
import 'package:flutter_application_1/screens/Home/type.dart';
import 'package:flutter_application_1/screens/QR/qr_doctor.dart';
import 'package:flutter_application_1/splash/splash_view.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Auth/authScreens/doctor_login/doctor_login.dart';
import 'Auth/authScreens/register_screen.dart';
import 'Auth/google_login.dart';
import 'Cubit/counter.dart';

import 'screens/UnUesd/Exercises_Page.dart';
import 'firebase_options.dart';
import 'screens/DoctorHome/doctor_page.dart';
import 'screens/memory_test/memory.dart';
import 'screens/patient_result.dart';
import 'screens/Home/DoctorList/doctor_list_page.dart';
import 'screens/circle_test/circleScreen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

// import 'firebase_options.dart';

SharedPreferences? mySharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(EasyLocalization(
      child: MyApp(),
      supportedLocales: [
        Locale("en", ""),
        Locale("ar", ""),
      ],
      path: "resource/langs"));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Parkinson',
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: ColorManager.appbarColor),
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: BlocProvider(
          create: (_) => CounterCubit(),
          child:
              AskLoginScreen(), // TappingSpeed(),//SplashView(),//SplashView()//TappingSpeed(),// PatientResult(),//PatientResult(),//DoctorPage(),//ExercisesPage(),//SplashView(),//TestPage(),//TappingSpeed(),//LoginScreen(), //ProfileInfo(), //scanner(), //ReslutScann(),//this is screen name ex that >>  SplashView(),
        ));
  }
}

  // ElevatedButton(onPressed: (){
  //                   EasyLocalization.of(context)?.setLocale(Locale('en', '')); 
  //                 }, child: Text("Change")),