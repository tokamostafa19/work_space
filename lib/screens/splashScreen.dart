import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/routes.dart';
import '../styles/colormanager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed( Duration(seconds: 2), () {
      if (mounted) {

        context.pushReplacement(Routes.onboardingScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primarycolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Logo.png'),
          ],
        ),
      ),
    );
  }
}