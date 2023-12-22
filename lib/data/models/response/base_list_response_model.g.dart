// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseListResponseModel<T> _$BaseListResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseListResponseModel<T>(
      json['page'] as int?,
      (json['result'] as List<dynamic>?)?.map(fromJsonT).toList(),
      json['total'] as int?,
      json['perPage'] as int?,
    );

Map<String, dynamic> _$BaseListResponseModelToJson<T>(
  BaseListResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'page': instance.page,
      'perPage': instance.perPage,
      'result': instance.result?.map(toJsonT).toList(),
      'total': instance.total,
    };
