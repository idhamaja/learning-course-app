import 'package:learning_course_app/common/entities/course.dart';

abstract class HomePageEvents {
  const HomePageEvents();
}

class HomePageDots extends HomePageEvents {
  final int index;
  const HomePageDots(this.index) : super();
}

//CourseItemEvents
class HomePageCourseItem extends HomePageEvents {
  const HomePageCourseItem(this.courseItem);
  final List<CourseItem> courseItem;
}
