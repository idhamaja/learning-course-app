import 'package:learning_course_app/common/entities/entities.dart';
import 'package:learning_course_app/common/utils/http_utils.dart';

class UserAPI {
  static login({LoginRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/login',
      queryParameters: params?.toJson(),
    );

    return UserLoginResponseEntity.fromJson(response);
  }
}
