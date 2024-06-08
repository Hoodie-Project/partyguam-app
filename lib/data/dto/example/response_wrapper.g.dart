// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseWrapper _$ResponseWrapperFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['data'],
  );
  return ResponseWrapper(
    data: json['data'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ResponseWrapperToJson(ResponseWrapper instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
