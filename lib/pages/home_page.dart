import 'package:flutter/material.dart';
import 'package:flutter_auth_test/pages/auth/anonymous.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnonymousLoginPage(),
    );
  }
}
