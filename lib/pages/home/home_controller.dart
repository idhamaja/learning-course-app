import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_course_app/common/apis/course_api.dart';
import 'package:learning_course_app/common/entities/entities.dart';
import 'package:learning_course_app/global.dart';
import 'package:learning_course_app/pages/home/bloc/home_page_blocs.dart';
import 'package:learning_course_app/pages/home/bloc/home_page_events.dart';

class HomeController {
  final BuildContext context;
  UserItem? userProfile = Global.storageService.getUserProfile();
  HomeController({required this.context});

  Future<void> init() async {
    //check and Make SURE THAT USER IS LOGGED IN AND THEN MAKE AN API CALL
    if (Global.storageService.getUserToken().isNotEmpty) {
      // print("... Home Controller init method...");
      var result = await CourseAPI.courseList();
      if (result.code == 200) {
        context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
        // print("Perfect!!!");
        // print(result.data![0].name);
      } else {
        print(result.code);
      }
    } else {
      print("USER HAS ALREADY LOGGED OUT");
    }
  }
}
