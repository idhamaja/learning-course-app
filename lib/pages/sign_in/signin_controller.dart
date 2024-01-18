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

        if (emailAddress.isEmpty) {}
        if (password.isEmpty) {
          //
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

          //
          if (credential.user == null) {}
          if (!credential.user!.emailVerified) {}

          var user = credential.user;
          if (user != null) {
            //Got verified user from Firebase
          }else {
            //Have error getting User from Firebase
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
