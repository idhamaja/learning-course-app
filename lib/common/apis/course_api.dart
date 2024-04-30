import 'package:learning_course_app/common/entities/course.dart';
import 'package:learning_course_app/common/utils/http_utils.dart';

class CourseAPI {
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post(
      'api/courseList',
    );
    print(response.toString());
    return CourseListResponseEntity.fromJson(response);
  }
}
