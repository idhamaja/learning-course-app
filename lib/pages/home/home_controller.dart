import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_course_app/common/apis/course_api.dart';
import 'package:learning_course_app/common/entities/entities.dart';
import 'package:learning_course_app/global.dart';
import 'package:learning_course_app/pages/home/bloc/home_page_blocs.dart';
import 'package:learning_course_app/pages/home/bloc/home_page_events.dart';

class HomeController {
  late BuildContext context;
  UserItem? get userProfile => Global.storageService.getUserProfile();

  //singletonClass
  static final HomeController _singleton = HomeController._external();
  HomeController._external();

  //factory constructor
  factory HomeController({required BuildContext context}) {
    _singleton.context = context;
    return _singleton;
  }

  Future<void> init() async {
    //check and Make SURE THAT USER IS LOGGED IN AND THEN MAKE AN API CALL
    if (Global.storageService.getUserToken().isNotEmpty) {
      // print("... Home Controller init method...");
      var result = await CourseAPI.courseList();
      print("The Result is ${(result.data![0].thumbnail!)}");
      if (result.code == 200) {
        //trigger event
        if (context.mounted) {
          context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
        }
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
