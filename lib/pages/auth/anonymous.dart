import 'package:flutter/material.dart';
import 'package:flutter_auth_test/pages/main_page.dart';
import 'package:flutter_auth_test/services/auth_service.dart';

class AnonymousLoginPage extends StatelessWidget {
  const AnonymousLoginPage({super.key});

  void _singInAnonymosly(BuildContext context) async {
    try {
      await AuthService().signInAnonymously();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
      );
    } catch (error) {
      print("Error: ${error}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anonymous LoginPage"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () => _singInAnonymosly(context),
                  child: Text("Sign in Anonymously"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
