import 'package:flutter/material.dart';
import 'package:flutter_auth_test/services/auth_service.dart';

class MainPage extends StatelessWidget {
    MainPage({super.key});

  final String userId = AuthService().getCurrentUser()?.uid ?? "unKonwn";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Hello, You are now Signin"),
          ],
        ),
      ),
    );
  }
}
