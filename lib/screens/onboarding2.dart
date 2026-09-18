import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workspace/screens/onboarding3.dart';
import 'package:workspace/screens/signin.dart';

import '../styles/colormanager.dart';
import '../widgets/custom_text_button.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

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
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset(
                          'assets/Onboarding Image.png',
                          width: 300,

                        ),

                        // Gradient
                       Positioned(
                         bottom:10,
                         child: Text(
                                'Find the practicality in \n making your todo list',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                       ),


                      ],
                    ),
                    Text(
                      'Easy-to-understand user interface  that makes you '
                          ' more comfortable when you want to create a task or '
                          ' to do list, Todyapp can also improve productivity',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black26,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 100),

                    SizedBox(
                      width: double.infinity,
                      child: CustomTextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>Onboarding3(),
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
