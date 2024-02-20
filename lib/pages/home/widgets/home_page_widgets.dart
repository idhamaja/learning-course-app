import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_course_app/common/values/colors.dart';
import 'package:learning_course_app/pages/home/bloc/home_page_blocs.dart';
import 'package:learning_course_app/pages/home/bloc/home_page_events.dart';
import 'package:learning_course_app/pages/home/bloc/home_page_states.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(
        left: 7.w,
        right: 7.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset(
              "assets/icons/menu.png",
            ),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/icons/person.png",
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homePageText(
  String text, {
  Color color = AppColors.primaryText,
  int top = 20,
}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(
            color: AppColors.primaryFourElementText,
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 17.w,
              ),
              width: 16.w,
              height: 16.w,
              child: Image.asset(
                "assets/icons/search.png",
              ),
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  hintText: "Search your course",
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  hintStyle: GoogleFonts.poppins(
                    color: AppColors.primarySecondaryElementText,
                  ),
                ),
                style: GoogleFonts.poppins(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                ),
                autocorrect: false,
              ),
            )
          ],
        ),
      ),

      //
      GestureDetector(
        child: Container(
          width: 40.h,
          height: 40.w,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(
              Radius.circular(13.w),
            ),
            border: Border.all(
              color: AppColors.primaryElement,
            ),
          ),
          child: Image.asset(
            "assets/icons/options.png",
          ),
        ),
      ),
    ],
  );
}

Widget slidersMenuView(BuildContext context, HomePageStates state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            print(value.toString());
            context.read<HomePageBlocs>().add(
                  HomePageDots(value),
                );
          },
          children: [
            _slidersContainter(path: "assets/icons/Art.png"),
            _slidersContainter(path: "assets/icons/Image(1).png"),
            _slidersContainter(path: "assets/icons/Image(2).png"),
          ],
        ),
      ),
      DotsIndicator(
        dotsCount: 3,
        position: state.index,
        decorator: DotsDecorator(
          color: AppColors.primaryThreeElementText,
          activeColor: AppColors.primaryElement,
          size: const Size.square(5.0),
          activeSize: const Size(17.0, 5.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    ],
  );
}

Widget _slidersContainter({String path = "assets/icons/Art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(20.h),
      ),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(
          path,
        ),
      ),
    ),
  );
}

Widget menuCourseView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          children: [
            _reusableMenuCourseText(),
          ],
        ),
      )
    ],
  );
}

Widget _reusableMenuCourseText() {
  return Container(
    child: Text(
      "Choose your courses",
      style: GoogleFonts.poppins(
        color: AppColors.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
      ),
    ),
  );
}
