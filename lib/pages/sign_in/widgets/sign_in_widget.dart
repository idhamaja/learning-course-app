import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar buildAppbar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: Colors.grey.withOpacity(0.5),
        //defines the thickness of the line
        height: 1.0,
      ),
    ),
    title: Center(
      child: Text(
        "Sign In",
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}

//Need context for accessing BLoC
Widget buildThirdPartySignIn(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
      top: 40.h,
      bottom: 20.h,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIicons("google"),
        _reusableIicons("apple"),
        _reusableIicons("facebook"),
      ],
    ),
  );
}

Widget _reusableIicons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 40.w,
      height: 40.w,
      child: Image.asset(
        "assets/icons/$iconName.png",
      ),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: GoogleFonts.poppins(
        color: Colors.grey.withOpacity(0.5),
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
    ),
  );
}

Widget buildTextField(String text, String textType) {
  return Container(
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [
          Container(
            width: 16.w,
            height: 16.w,
            margin: EdgeInsets.only(left: 17.w),
            child: Image.asset(
              "assets/icons/user.png",
            ),
          ),
          SizedBox(
            width: 270.w,
            height: 50.h,
            child: const TextField(
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: "Enter Your Email Address",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          )
        ],
      ));
}
