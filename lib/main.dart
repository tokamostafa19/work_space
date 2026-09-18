import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  print('Firebase initialized');
  print('Current user: ${FirebaseAuth.instance.currentUser}');

  try {
    final credential =
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: 'test123456@gmail.com',
      password: 'Test123456!',
    );

    print('SUCCESS');
    print(credential.user?.uid);
  } on FirebaseAuthException catch (e) {
    print('AUTH CODE: ${e.code}');
    print('AUTH MESSAGE: ${e.message}');
  } catch (e) {
    print('OTHER ERROR: $e');
  }

  runApp(const MyApp());
}
