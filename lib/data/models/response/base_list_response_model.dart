import 'package:json_annotation/json_annotation.dart';
import 'package:ebook_name/domain/entities/response/base_list_response.dart';

part 'base_list_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseListResponseModel<T> implements BaseListResponse<T> {
  BaseListResponseModel(this.page, this.result, this.total, this.perPage);

  @override
  @JsonKey(name: 'page')
  final int? page;

  @override
  @JsonKey(name: 'perPage')
  final int? perPage;

  @override
  @JsonKey(name: 'result')
  final List<T>? result;

  @override
  @JsonKey(name: 'total')
  final int? total;

  factory BaseListResponseModel.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseListResponseModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseListResponseModelToJson(this, toJsonT);
}
