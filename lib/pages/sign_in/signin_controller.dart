import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_course_app/pages/sign_in/bloc/signin_blocs.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        //BlocProvider.of<SignInBlocs>(context).state
        final state = context.read<SignInBlocs>().state;

        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          //
          print("Email is EMPTY");
        } else {
          print("Email is ${emailAddress}");
        }
        if (password.isEmpty) {
          //
          print("Password EMPTY");
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

          //
          if (credential.user == null) {
            //
            print("User Does Not EXIST");
          }
          if (!credential.user!.emailVerified) {
            //
            print("User is NOT VERIFIED");
          }

          var user = credential.user;
          if (user != null) {
            //Got verified user from Firebase
            print("User EXIST");
          } else {
            //Have error getting User from Firebase
            print("No User");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            print('Wrong user provided for that user.');
          } else if (e.code == 'invalid-email') {
            print("Your email format is incorrect");
          }
        }
      }
    } catch (e) {}
  }
}
