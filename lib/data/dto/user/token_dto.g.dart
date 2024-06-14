// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenDto _$TokenDtoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['token', 'value'],
  );
  return TokenDto(
    token: json['token'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$TokenDtoToJson(TokenDto instance) => <String, dynamic>{
      'token': instance.token,
      'value': instance.value,
    };
