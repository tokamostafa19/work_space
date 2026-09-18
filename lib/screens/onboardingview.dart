import 'package:flutter/material.dart';
import 'package:workspace/screens/onboarding2.dart';
import 'package:workspace/screens/signin.dart';
import 'package:workspace/styles/colormanager.dart';
import 'package:workspace/widgets/custom_text_button.dart';

class Onboardingview extends StatefulWidget {
  const Onboardingview({super.key});

  @override
  State<Onboardingview> createState() => _OnboardingviewState();
}

class _OnboardingviewState extends State<Onboardingview> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 20,
            right: 20,
            bottom: 15,
          ),

          child: Column(
            children: [

              Align(
                alignment: Alignment.topRight,
                child: CustomTextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignIn(),
                      ),
                    );
                  },
                  btnTitle: 'Skip',
                  background: Colors.transparent,
                ),
              ),

              Expanded(
                child: Column(
                  children: [

                    Expanded(
                      flex: 5,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [

                          Image.asset(
                            'assets/X Mockup@2x.png',
                            width: 200,
                            fit: BoxFit.contain,
                          ),

                          // Gradient
                          Container(
                            height: 180,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.white,
                                  ColorManager.backgroundcolor,
                                  Colors.white.withAlpha(0),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Your convenience in\n making a todo list',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                    Text(
                      'Here’s a mobile platform that helps you create '
                          'tasks or to-do lists so that it can help you in '
                          'every job easier and faster.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black26,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 40),

                    SizedBox(
                      width: double.infinity,
                      child: CustomTextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>Onboarding2(),
                            ),
                          );
                        },
                        btnTitle: 'Continue',
                        background: ColorManager.primarycolor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}