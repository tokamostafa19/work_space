import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import '../core/fireservices.dart';

class SignInController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final FirebaseServices firebaseServices = FirebaseServices();

  void con() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Future<void> login() async {
    await firebaseServices.login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}