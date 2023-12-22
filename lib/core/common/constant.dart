import 'package:flutter_screenutil/flutter_screenutil.dart';

final double kRadiusButton = 12.r;
final double kRadiusTextField = 8.0.r;

class Constant {
  static final RegExp passwordRegexp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*()<>?~_+|=;:]).{8,}$');
  static final RegExp emailRegexp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
}

class Pagination {
  static const int bookCollectionPageSize = 20;
  static const int searchBookPageSize = 20;
  static const int bookCategoryPageSize = 20;
  static const int userFavoriteBookPageSize = 20;
  static const int firstPage = 1;
}
