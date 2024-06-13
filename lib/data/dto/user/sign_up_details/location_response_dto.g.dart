// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationResponseDto _$LocationResponseDtoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['count', 'data'],
  );
  return LocationResponseDto(
    count: (json['count'] as num).toInt(),
    data: (json['data'] as List<dynamic>)
        .map((e) => LocationDto.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LocationResponseDtoToJson(
        LocationResponseDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      'data': instance.data,
    };
