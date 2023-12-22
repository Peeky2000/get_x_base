class UrlEndPoint {
  static _Auth auth = _Auth();
  static _User user = _User();
  static _Learner learner = _Learner();
  static _Course course = _Course();
}

class _Auth {
  final String _userPath = '/users';

  String get signIn => '$_userPath/signin';
  String get signUp => '$_userPath/signUp';
  String get forgotPassword => '$_userPath/forgotpassword';
  String get resetPassword => '$_userPath/confirmforgotpassword';
  String get refreshToken => '$_userPath/refreshtoken';
}

class _User {
  final String _userPath = '/users';

  String get user => _userPath;
}

class _Learner {
  final String _learnersPath = '/learners';

  String get learners => _learnersPath;
}

class _Course {
  final String _coursesPath = '/courses';

  String get courses => _coursesPath;
}
