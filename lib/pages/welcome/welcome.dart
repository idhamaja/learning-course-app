import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(
            top: 34.h,
          ),
          width: 375.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                children: [
                  _welcomePage(
                    1,
                    context,
                    "Next",
                    "Learning In The Beginning",
                    "Forget about a for of paper all knowledge in one learning.",
                    "image path",
                  ),
                  _welcomePage(
                    2,
                    context,
                    "Next",
                    "Connect With Everyone",
                    "Alway keep in touch with your mentor & friends. Let's get connected!",
                    "image path",
                  ),
                  _welcomePage(
                    3,
                    context,
                    "Get Started",
                    "Always Facinated Learning",
                    "Anytime, anywhere. The time is at your disrection so study whenever you want.",
                    "image path",
                  ),
                ],
              ),

              //
              Positioned(
                bottom: 75.h,
                child: DotsIndicator(
                  dotsCount: 3,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                      color: Colors.grey,
                      activeColor: Colors.blue,
                      size: const Size.square(8.0),
                      activeSize: const Size(10.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Welcome Widgets
  Widget _welcomePage(
    int index,
    BuildContext context,
    String buttonName,
    String title,
    String subTitle,
    String imagePath,
  ) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: const Text(
            "Contoh Gambar 1",
          ),
        ),
        Container(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        //
        Container(
          width: 375.w,
          padding: EdgeInsets.only(
            left: 30.w,
            right: 30.w,
          ),
          child: Text(
            subTitle,
            style: GoogleFonts.poppins(
              color: Colors.black.withOpacity(0.5),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        //Button
        Container(
          margin: EdgeInsets.only(
            top: 100.h,
            left: 25.w,
            right: 25.w,
          ),
          width: 325.w,
          height: 50.h,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  15.w,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(3, 6),
                )
              ]),
          child: Center(
            child: Text(
              buttonName,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
