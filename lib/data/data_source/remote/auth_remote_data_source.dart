import 'package:ebook_name/data/data_source/remote/api_client.dart';
import 'package:ebook_name/data/data_source/remote/url_end_point.dart';
import 'package:ebook_name/data/models/request/sign_up_request_model.dart';
import 'package:ebook_name/data/models/response/base_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> signUp({required SignUpRequestModel request});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiHandler _apiHandler;

  AuthRemoteDataSourceImpl(this._apiHandler);

  @override
  Future<void> signUp({required SignUpRequestModel request}) async {
    Map<String, dynamic> body = request.toJson();
    body.removeWhere((key, value) => value == null || value.toString().isEmpty);
    BaseResponseModel<dynamic> response = await _apiHandler.post(
        UrlEndPoint.auth.signUp,
        body: body,
        parser: (json) => json.toString());
    return response.data;
  }
}
