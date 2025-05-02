import 'package:demo/tp/form/login_form.dart';
import 'package:demo/tp/layout/x_app_bar.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XAppBar(title: "Login"),
      body: LoginForm(),
    );
  }
}