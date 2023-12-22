import 'package:dio/dio.dart';
import 'package:ebook_name/data/data_source/local/token_provider.dart';
import 'package:sli_common/extension/extensions.dart';

class AuthInterceptor extends QueuedInterceptor {
  final TokenProvider _tokenProvider;

  AuthInterceptor(this._tokenProvider);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _tokenProvider.token;
    if (token.accessToken.isNotNullOrEmpty && !options.path.isUrl) {
      options.headers['Authorization'] = 'Bearer ${token.accessToken}';
    }
    options.headers['Content-Type'] = 'application/json';
    return super.onRequest(options, handler);
  }
}
