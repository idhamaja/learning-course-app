import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_course_app/common/values/colors.dart';
import 'package:learning_course_app/pages/home/home_page.dart';
import 'package:learning_course_app/pages/profile/profile_page.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    const HomePage(),
    const Center(child: Text("Search Page")),
    const Center(child: Text("Course Page")),
    const Center(child: Text("Chat Page")),
    const ProfilePage(),
  ];

  return _widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
    label: "home",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/home.png",
      ),
    ),
    activeIcon: SizedBox(
      child: Image.asset(
        "assets/icons/home.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),

  //
  BottomNavigationBarItem(
    label: "search",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/search.png",
      ),
    ),
    activeIcon: SizedBox(
      child: Image.asset(
        "assets/icons/search.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),

  //
  BottomNavigationBarItem(
    label: "course",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/play-circle1.png",
      ),
    ),
    activeIcon: SizedBox(
      child: Image.asset(
        "assets/icons/play-circle1.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),

  //
  BottomNavigationBarItem(
    label: "chat",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/message-circle.png",
      ),
    ),
    activeIcon: SizedBox(
      child: Image.asset(
        "assets/icons/message-circle.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),

  //
  BottomNavigationBarItem(
    label: "profile",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/person2.png",
      ),
    ),
    activeIcon: SizedBox(
      child: Image.asset(
        "assets/icons/person2.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
];
