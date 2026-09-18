import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/register_controller.dart';
import '../features/routes.dart';
import '../styles/colormanager.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_text_field.dart';
import 'homepage.dart';
import 'managment/home_cubit.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final RegisterController controller = RegisterController();

  @override
  void initState() {
    super.initState();

    controller.con();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

               SizedBox(height: 40),

               Center(
                child: Text(
                  'Create account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

               SizedBox(height: 10),

               Center(
                child: Text(
                  'Create your account and feel the benefits',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),

               SizedBox(height: 30),

              CustomTextField(
                label: 'Username',
                hint: 'Enter your username',
                controller: controller.usernameController,
              ),

               SizedBox(height: 20),

              CustomTextField(
                label: 'Email Address',
                hint: 'name@example.com',
                controller: controller.emailController,
              ),

               SizedBox(height: 20),

              CustomTextField(
                label: 'Password',
                hint: 'Enter your password',
                obscureText: true,
                suffixIcon:  Icon(
                  Icons.visibility_off_outlined,
                  color: Color(0xffAAB2C0),
                ),
                controller: controller.passwordController,
              ),

               Spacer(),

              Center(
                child: CustomTextButton(
                  onPressed: () async {

                    try {

                      await controller.register();

                      if (!context.mounted) return;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => HomeCubit(),
                            child: Homepage(),
                          ),
                        ),
                      );

                    } catch (e) {

                      ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(e.toString()),
                            ),
                          );

                    }
                  },
                  btnTitle: 'Sign Up',
                ),
              ),

               SizedBox(height: 10),

              Center(
                child: RichText(
                  text: TextSpan(
                    children: [

                      TextSpan(
                        text: 'Already have account?',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),

                      TextSpan(
                        text: ' Log In',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.go(Routes.signIn);
                          },
                        style: TextStyle(
                          color: ColorManager.darkcolor,
                          fontSize: 14,
                        ),
                      ),

                    ],
                  ),
                ),
              ),

               Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}