import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_course_app/pages/common_widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppbar(
            "Sign up",
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: reusableText(
                      "Enter your details below and free Sign up."),
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
                      reusableText("Username"),
                      buildTextField("Enter your username", "username", "user",
                          (value) {}),
                      reusableText("Email"),
                      buildTextField(
                          "Enter Your Email Address", "email", "user", (value) {
                        // context.read<SignInBlocs>().add(EmailEvents(value));
                      }),
                      reusableText("Password"),
                      buildTextField("Enter Your Password", "password", "lock",
                          (value) {
                        // context
                        //     .read<SignInBlocs>()
                        //     .add(PasswordEvents(value));
                      }),
                      reusableText("Confirm Password"),
                      buildTextField("Enter your Confirm password", "password",
                          "lock", (value) {}),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25.w),
                  child: reusableText(
                    "By creating an account you have to agree with our term & condition",
                  ),
                ),
                buildSignInAndRegButton("Sign up", "login", () {
                  Navigator.of(context).pushNamed("register");
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
