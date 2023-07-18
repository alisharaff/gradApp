import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/resources/color_manager.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;

  const MyButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color:  ColorManager.btuColor,//Color.fromARGB(255, 2, 77, 69),
          borderRadius: BorderRadius.circular(8),
        ),
        child:  Center(
          child: Text(
            "SignUp".tr().toString(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
