import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_course_app/pages/sign_in/bloc/signin_blocs.dart';
import 'package:learning_course_app/pages/sign_in/bloc/signin_events.dart';
import 'package:learning_course_app/pages/sign_in/bloc/signin_states.dart';
import 'package:learning_course_app/pages/sign_in/signin_controller.dart';
import 'package:learning_course_app/pages/common_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBlocs, SignInStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppbar("Login"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartySignIn(context),
                    Center(
                      child:
                          reusableText("Or use your account Email to Sign In"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 36.h),
                      padding: EdgeInsets.only(
                        left: 25.w,
                        right: 25.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("Email"),
                          SizedBox(height: 5.h),
                          buildTextField(
                              "Enter Your Email Address", "email", "user",
                              (value) {
                            context.read<SignInBlocs>().add(EmailEvents(value));
                          }),
                          reusableText("Password"),
                          SizedBox(height: 5.h),
                          buildTextField(
                              "Enter Your Password", "password", "lock",
                              (value) {
                            context
                                .read<SignInBlocs>()
                                .add(PasswordEvents(value));
                          }),
                        ],
                      ),
                    ),
                    forgotPassword(),
                    SizedBox(height: 70.h),
                    buildSignInAndRegButton("Login", "login", () {
                      SignInController(context: context).handleSignIn("email");
                    }),
                    buildSignInAndRegButton("Sign up", "register", () {
                      Navigator.of(context).pushNamed("/register_page");
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
