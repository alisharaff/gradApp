import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screens/Home/Test_Page.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Home/add_pa_to_doc.dart';

//flutter_barcode_scanner this is to do scann
class scanner extends StatefulWidget {
  const scanner({Key? key}) : super(key: key);

  @override
  State<scanner> createState() => _scannerState();
}

String paId = '1';

Future<void> getPaId() async {
  SharedPreferences userData = await SharedPreferences.getInstance();

  paId = userData.getString("UserName")!;
  print(paId);
}

//// Function to Scann
Future<void> scanQR() async {
  //async  TO WAITING
  String barcodeScanRes;
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.QR);
    addPatientToDoctor(
      barcodeScanRes,paId
    );
     Fluttertoast.showToast(
        msg: 'Added successfully',
        toastLength: Toast
            .LENGTH_SHORT, // Duration: Toast.LENGTH_SHORT or Toast.LENGTH_LONG
        gravity: ToastGravity
            .BOTTOM, // ToastGravity.TOP, ToastGravity.CENTER, or ToastGravity.BOTTOM
        backgroundColor: Colors.teal, // Background color of the toast
        textColor: Colors.white, // Text color of the toast
        fontSize: 16.0, // Font size of the toast message
      );
    print(barcodeScanRes);
  } on PlatformException {
     Fluttertoast.showToast(
        msg: 'Added Failed',
        toastLength: Toast
            .LENGTH_SHORT, // Duration: Toast.LENGTH_SHORT or Toast.LENGTH_LONG
        gravity: ToastGravity
            .BOTTOM, // ToastGravity.TOP, ToastGravity.CENTER, or ToastGravity.BOTTOM
        backgroundColor: Colors.teal, // Background color of the toast
        textColor: Colors.white, // Text color of the toast
        fontSize: 16.0, // Font size of the toast message
      );
    barcodeScanRes = 'Failed to get platform version.';
  }
}

class _scannerState extends State<scanner> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPaId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.teal),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return const TestPage();
                  },
                ));
              },
            ),
            backgroundColor: Colors.white,
            title: Text(
              "ScanToConnect".tr().toString(),
              style: TextStyle(color: Colors.teal),
            )),
        body: Builder(builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    child: Flex(
                        direction: Axis.vertical,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.teal),
                              ),
                              onPressed: () => scanQR(),
                              child: Text('StartQRscan'.tr().toString())),
                        ])),
                Text("AlignQRCodeWithinframetoconnect".tr().toString())
              ],
            ),
          );
        }));
  }
}
