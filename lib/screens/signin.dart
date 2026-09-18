import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:workspace/screens/homepage.dart';
import 'package:workspace/styles/colormanager.dart';

import '../features/routes.dart';
import '../features/signin_controller.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_text_field.dart';
import 'managment/home_cubit.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final SignInController controller = SignInController();

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
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

               SizedBox(height: 10),

              Center(
                child: Text(
                  'Your work faster and structured with Todyapp',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ),

               SizedBox(height: 30),

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

                      await controller.login();

                      if (!context.mounted) return;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => HomeCubit(),
                            child: const Homepage(),
                          ),
                        ),
                      );

                    } catch (e) {

                      ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                          content: Text(
                            'Invalid email or password',
                          ),
                        ),
                      );

                    }
                  },
                  btnTitle: 'Log in',
                ),
              ),

               SizedBox(height: 10),

              Center(
                child: RichText(
                  text: TextSpan(
                    children: [

                      TextSpan(
                        text: 'Don\'t have an Account?',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),

                      TextSpan(
                        text: ' Sign Up',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.go(Routes.register);
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