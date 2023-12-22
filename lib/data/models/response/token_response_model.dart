import 'package:json_annotation/json_annotation.dart';
import 'package:ebook_name/domain/entities/response/token_entity.dart';

part 'token_response_model.g.dart';

@JsonSerializable()
class TokenResponseModel implements TokenResponse {
  TokenResponseModel({this.accessToken, this.refreshToken});

  @override
  @JsonKey(name: 'accessToken')
  String? accessToken;

  @override
  @JsonKey(name: 'refreshToken')
  String? refreshToken;

  factory TokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseModelToJson(this);
}
