abstract class BaseListResponse<T> {
  int? get total;

  int? get page;

  int? get perPage;

  List<T>? get result;
}
