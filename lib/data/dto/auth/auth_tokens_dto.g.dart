// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_tokens_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthTokensDto _$AuthTokensDtoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['refreshToken'],
  );
  return AuthTokensDto(
    refreshToken: json['refreshToken'] as String,
  );
}

Map<String, dynamic> _$AuthTokensDtoToJson(AuthTokensDto instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
    };
