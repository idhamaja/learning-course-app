import 'package:learning_course_app/common/entities/course.dart';

class HomePageStates {
  const HomePageStates({
    this.courseItem = const <CourseItem>[],
    this.index = 0,
  });

  final int index;
  final List<CourseItem> courseItem;

  //copyWith Method
  HomePageStates copywith({int? index, List<CourseItem>? courseItem}) {
    return HomePageStates(
      courseItem: courseItem ?? this.courseItem,
      index: index ?? this.index,
    );
  }
}
