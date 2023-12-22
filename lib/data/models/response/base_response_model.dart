import 'package:json_annotation/json_annotation.dart';
import 'package:ebook_name/domain/entities/response/base_response.dart';

part 'base_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponseModel<T> implements BaseResponse<T> {
  BaseResponseModel(this.data, this.message);

  @override
  @JsonKey(name: 'data')
  final T? data;

  @override
  @JsonKey(name: 'message')
  final String message;

  factory BaseResponseModel.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseResponseModelToJson(this, toJsonT);
}
