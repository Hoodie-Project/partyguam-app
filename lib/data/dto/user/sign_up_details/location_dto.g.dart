// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDto _$LocationDtoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'province', 'city'],
  );
  return LocationDto(
    id: (json['id'] as num).toInt(),
    province: json['province'] as String,
    city: json['city'] as String,
  );
}

Map<String, dynamic> _$LocationDtoToJson(LocationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'province': instance.province,
      'city': instance.city,
    };
