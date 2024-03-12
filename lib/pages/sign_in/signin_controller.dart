import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:learning_course_app/common/apis/user_api.dart';
import 'package:learning_course_app/common/entities/entities.dart';
import 'package:learning_course_app/common/values/constant.dart';
import 'package:learning_course_app/common/widgets/flutter_toast.dart';
import 'package:learning_course_app/global.dart';
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
          toastInfo(msg: "You Need Fill Email Address.");
          return;
        }
        if (password.isEmpty) {
          //
          print("Password EMPTY");
          toastInfo(msg: "Your Need Fill Password.");
          return;
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
            toastInfo(msg: "Your Account Doesn't Exist.");
            return;
          }
          if (!credential.user!.emailVerified) {
            //
            print("User is NOT VERIFIED");
            toastInfo(msg: "You Need To Verify Your Email Account.");
            return;
          }

          var user = credential.user;
          if (user != null) {
            //Got it from Google
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;

            print("My URL IS ${photoUrl}");

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.name = displayName;
            loginRequestEntity.email = email;
            loginRequestEntity.open_id = id;
            loginRequestEntity.type = 1;

            //Got verified user from Firebase
            print("User EXIST");

            //
            asyncPostAllData(loginRequestEntity);
            //Local Storage
            // Global.storageService
            //     .setString(AppConstant.STORAGE_USER_TOKEN_KEY, "terserah");
            // Navigator.of(context)
            //     .pushNamedAndRemoveUntil("/application", (route) => false);
          } else {
            //Have error getting User from Firebase
            print("No User");
            toastInfo(msg: "Currently You Are Not A User Of This Application.");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No User Found For That Email.');
            toastInfo(msg: "No User Found For That Email.");
          } else if (e.code == 'wrong-password') {
            print('Wrong User Provided For That User.');
            toastInfo(msg: "Wrong Provided For That User.");
          } else if (e.code == 'invalid-email') {
            print("Your Email Format is Incorrect.");
            toastInfo(msg: "Your Email Address Format Is Incorrect.");
          }
        }
      }
    } catch (e) {}
  }

  //
  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    var result = await UserAPI.login(params: loginRequestEntity);
  }
}
