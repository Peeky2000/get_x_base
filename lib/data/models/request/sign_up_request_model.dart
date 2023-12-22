import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_model.g.dart';

@JsonSerializable()
class SignUpRequestModel {
  SignUpRequestModel({
    required this.username,
    required this.email,
    required this.password,
    this.phone,
    this.realName,
    this.userAddress,
  });

  @JsonKey(name: 'username')
  String username;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'password')
  String password;

  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'realName')
  String? realName;

  @JsonKey(name: 'userAddress')
  String? userAddress;

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);
}
