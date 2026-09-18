import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:workspace/screens/signin.dart';
import '../styles/colormanager.dart';
import '../widgets/custom_text_button.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Center(
          child: Positioned(
            bottom: 70,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 50,),
                          Image.asset(
                            'assets/Onboarding Image (1).png',
                            width: 300,
                          ),

                       SizedBox(height: 40),

                      CustomTextButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignIn(),
                          ),
                        );
                      }, btnTitle: 'Continue with email ',
                        background: ColorManager.primarycolor,
                        icon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: 12,),
                      Row(
                        children: [
                           Expanded(
                            child: Divider(
                              color: Color(0xffE5E7EB),
                              thickness: 1,
                            ),
                          ),

                           Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            child: Text(
                              'or continue with',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),

                           Expanded(
                            child: Divider(
                              color: Color(0xffE5E7EB),
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 18),

                      Row(
                        children: [
                          CustomTextButton(
                            onPressed: () {},
                            btnTitle: 'Facebook',
                            icon: Icon(
                              Icons.facebook,
                              color: Colors.blue,
                            ),
                            btnColor: Colors.black,
                            background: ColorManager.outlinrcolor,
                            fontSize: 14,
                          ),
                          CustomTextButton(
                            onPressed: () {},
                            btnTitle: 'with Google',
                            fontSize: 14,
                            btnColor: Colors.black,
                            background: ColorManager.outlinrcolor,
                            icon: Image.asset(
                              'assets/True.png',
                              width: 13,
                              height: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}