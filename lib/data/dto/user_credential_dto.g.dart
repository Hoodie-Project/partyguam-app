// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_credential_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCredentialDto _$UserCredentialDtoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['uid', 'idToken'],
  );
  return UserCredentialDto(
    uid: json['uid'] as String,
    idToken: json['idToken'] as String,
  );
}

Map<String, dynamic> _$UserCredentialDtoToJson(UserCredentialDto instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'idToken': instance.idToken,
    };
