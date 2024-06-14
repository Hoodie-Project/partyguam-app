// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessDto _$SuccessDtoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['response'],
  );
  return SuccessDto(
    response: json['response'] as String,
  );
}

Map<String, dynamic> _$SuccessDtoToJson(SuccessDto instance) =>
    <String, dynamic>{
      'response': instance.response,
    };
