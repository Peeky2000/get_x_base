import 'package:ebook_name/data/models/request/sign_up_request_model.dart';

abstract class AuthRepo {
  bool isLogin();

  Future<dynamic> signUp({required SignUpRequestModel request});
}
