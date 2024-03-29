import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_course_app/common/values/constant.dart';
import 'package:learning_course_app/common/widgets/flutter_toast.dart';
import 'package:learning_course_app/pages/register/bloc/register_blocs.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  //method
  Future<void> handleEmailRegister() async {
    final stateEmailRegister = context.read<RegisterBlocs>().state;
    String username = stateEmailRegister.username;
    String email = stateEmailRegister.email;
    String password = stateEmailRegister.password;
    String rePassword = stateEmailRegister.rePassword;

    if (username.isEmpty) {
      toastInfo(msg: "username cannot be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email cannot be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password cannot be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Your password confirmation is wrong");
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);
        //UPLOAD PHOTO URL
        String photoUrl = "uploads/default.jpeg";
        await credential.user?.updatePhotoURL(photoUrl);
        toastInfo(
            msg:
                "Your email has been sent to your Registered Email. To activate it please check your email box and click on the link.");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "Your email is already in use.");
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "Your email ID is invalid.");
      }
    }
  }
}
