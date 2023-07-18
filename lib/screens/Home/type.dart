import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Home/Test_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GenderSelectionScreen extends StatefulWidget {
  @override
  _GenderSelectionScreenState createState() => _GenderSelectionScreenState();
}
class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String selectedGenderPreference = '';

  @override
  void initState() {
    super.initState();
    loadSelectedGender();
  }

  Future<void> loadSelectedGender() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String gender = prefs.getString('selectedGender') ?? '';
    setState(() {
      selectedGenderPreference = gender;
    });
  }

  Future<void> saveSelectedGender(String gender) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedGender', gender);
  }

  void navigateToTestPage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return TestPage();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gender Selection'),
        backgroundColor: Color.fromARGB(255, 45, 165, 151),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  selectedGenderPreference = 'male';
                  saveSelectedGender(selectedGenderPreference);
                  navigateToTestPage();
                });
              },
              child: Icon(
                Icons.male,
                size: 100,
                color: selectedGenderPreference == 'male'
                    ? Colors.blue
                    : Colors.grey,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedGenderPreference = 'female';
                  saveSelectedGender(selectedGenderPreference);
                  navigateToTestPage();
                });
              },
              child: Icon(
                Icons.female,
                size: 100,
                color: selectedGenderPreference == 'female'
                    ? Colors.blue
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
