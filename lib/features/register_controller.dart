import 'package:flutter/material.dart';
import '../core/fireservices.dart';

class RegisterController {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final FirebaseServices firebaseServices = FirebaseServices();

  void con() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Future<void> register() async {
    print('EMAIL: "${emailController.text}"');
    print('PASSWORD: "${passwordController.text}"');

    await firebaseServices.register(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}