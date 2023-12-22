enum Environment { LOCAL, DEV, STAGING, PROD }

enum LoadingStatus {
  initial,
  loading,
  refresh,
  loadMore,
  complete,
  noMoreData,
  loadMoreError,
  error,
}

enum AppLanguage {
  vi,
  en,
}

enum HomeSessionType {

  recommend(name: 'Đề xuất'),
  favourite(name: 'Yêu thích');
  final String name;

  const HomeSessionType({required this.name});
}
