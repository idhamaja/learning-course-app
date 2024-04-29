import 'package:flutter/material.dart';
import 'package:learning_course_app/common/apis/course_api.dart';
import 'package:learning_course_app/common/entities/entities.dart';
import 'package:learning_course_app/global.dart';

class HomeController {
  final BuildContext context;
  UserItem? userProfile = Global.storageService.getUserProfile();
  HomeController({required this.context});

  Future<void> init() async {
    // print("... Home Controller init method...");
    await CourseAPI.courseList();
  }
}
