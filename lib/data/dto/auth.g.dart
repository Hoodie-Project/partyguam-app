// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth _$AuthFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['accessToken', 'refreshToken'],
  );
  return Auth(
    accessToken: json['accessToken'] as String,
    refreshToken: json['refreshToken'] as String,
  );
}

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
