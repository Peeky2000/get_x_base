import 'package:ebook_name/data/data_source/local/token_provider.dart';
import 'package:ebook_name/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ebook_name/data/models/request/sign_up_request_model.dart';
import 'package:ebook_name/domain/repositories/auth_repo.dart';
import 'package:sli_common/extension/extensions.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;
  final TokenProvider _tokenProvider;

  AuthRepoImpl(this._authRemoteDataSource, this._tokenProvider);

  @override
  bool isLogin() {
    return _tokenProvider.token.accessToken.isNotNullOrEmpty;
  }

  @override
  Future<void> signUp({required SignUpRequestModel request}) {
    return _authRemoteDataSource.signUp(request: request);
  }
}
