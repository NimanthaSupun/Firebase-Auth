import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_test/pages/auth/login.dart';
import 'package:flutter_auth_test/pages/main_page.dart';
import 'package:flutter_auth_test/services/auth_service.dart';
import 'package:flutter_auth_test/widgets/custom_button.dart';
import 'package:flutter_auth_test/widgets/custom_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  // register method

  Future<void> _registerUser(BuildContext context) async {

    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });
    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      final confirmPassword = _confirmPasswordController.text.trim();

      if (password != confirmPassword) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Error"),
            content: Text("Do not match password"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("ok"),
              ),
            ],
          ),
        );
        return;
      }
      await AuthService().registerNewUser(email: email, password: password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
      );
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("Error register user: ${error}"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("ok"),
            ),
          ],
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
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
                  CustomInput(
                    title: "Confirm Password",
                    controller: _confirmPasswordController,
                    obScureTest: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please confirm your password";
                      } else if (value != _passwordController.text) {
                        return "passwords do not match";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomButton(
                          title: "Register",
                          onPressed: () => _registerUser(context),
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
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        "Already have an account? Login here",
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
