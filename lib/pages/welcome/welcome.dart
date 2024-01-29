import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_course_app/common/values/colors.dart';
import 'package:learning_course_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:learning_course_app/pages/welcome/bloc/welcome_events.dart';
import 'package:learning_course_app/pages/welcome/bloc/welcome_states.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBlocs, WelcomeStates>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(
                top: 34.h,
              ),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBlocs>(context)
                          .add(WelcomeEvents());
                      print("Index Value is ${index}");
                    },
                    children: [
                      _welcomePage(
                        1,
                        context,
                        "Next",
                        "Learning In The Beginning",
                        "Forget about a for of paper all knowledge in one learning.",
                        "assets/images/highschoolgirl1_fix.png",
                      ),
                      _welcomePage(
                        2,
                        context,
                        "Next",
                        "Connect With Everyone",
                        "Alway keep in touch with your mentor & friends. Let's get connected!",
                        "assets/images/highschoolgirl2_fix.png",
                      ),
                      _welcomePage(
                        3,
                        context,
                        "Get Started",
                        "Always Facinated Learning",
                        "Anytime, anywhere. The time is at your disrection so study whenever you want.",
                        "assets/images/highschoolgirl3_fix.png",
                      ),
                    ],
                  ),

                  //
                  Positioned(
                    bottom: 75.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                          color: AppColors.primaryThreeElementText,
                          activeColor: AppColors.primaryElement,
                          size: const Size.square(8.0),
                          activeSize: const Size(18.0, 8.0),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    ),
                  ),
                ],
              ),
            );
          },
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
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          title,
          style: GoogleFonts.poppins(
            color: AppColors.primaryText,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
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
              color: AppColors.primarySecondaryElementText,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        //Button
        GestureDetector(
          onTap: () {
            //within 0-2 index
            if (index < 3) {
              //animation
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            } else {
              //route to new page
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("signIn", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 100.h,
              left: 25.w,
              right: 25.w,
            ),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(
                  Radius.circular(15.w),
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
        ),
      ],
    );
  }
}
