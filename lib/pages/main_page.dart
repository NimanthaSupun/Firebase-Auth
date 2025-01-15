import 'package:flutter/material.dart';
import 'package:flutter_auth_test/pages/auth/register.dart';
import 'package:flutter_auth_test/services/auth_service.dart';
import 'package:flutter_auth_test/widgets/custom_button.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final String userId = AuthService().getCurrentUser()?.uid ?? "unKonwn";

  void _signOut(BuildContext context) async {
    await AuthService().signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome",
          style: TextStyle(
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Hello, You are now Signin",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(
              title: "Sign Out",
              onPressed: () => _signOut(context),
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
