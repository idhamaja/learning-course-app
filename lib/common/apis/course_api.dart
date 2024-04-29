import 'package:learning_course_app/common/utils/http_utils.dart';

class CourseAPI {
  static courseList() async {
    var response = await HttpUtil().post(
      'api/courseList',
    );
    print(response.toString());
  }
}
