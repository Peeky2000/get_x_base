import 'package:ebook_name/data/models/request/sign_up_request_model.dart';
import 'package:ebook_name/domain/repositories/auth_repo.dart';

class AuthUseCase {
  final AuthRepo _authRepo;

  AuthUseCase(this._authRepo);

  bool get isLogin => _authRepo.isLogin();

  Future<void> signUp({required SignUpRequestModel request}) {
    return _authRepo.signUp(request: request);
  }

  Future<void> logout() async {}
}
