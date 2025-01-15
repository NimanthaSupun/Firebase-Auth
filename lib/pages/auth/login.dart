import 'package:flutter/material.dart';
import 'package:flutter_auth_test/pages/auth/register.dart';
import 'package:flutter_auth_test/widgets/custom_button.dart';
import 'package:flutter_auth_test/widgets/custom_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInput(
                    title: "Email",
                    obScureTest: false,
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  CustomInput(
                    title: "Password",
                    controller: _passwordController,
                    obScureTest: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter a password";
                      } else if (value.length < 6) {
                        return "password must be at least 6 characters long";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    title: "Login",
                    onPressed: () {},
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        "Don't have an account? Register here",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
