import 'package:json_annotation/json_annotation.dart';

import 'location_dto.dart';

part 'location_response_dto.g.dart';

@JsonSerializable()
class LocationResponseDto {
  LocationResponseDto({
    required this.count,
    required this.data,
  });

  /// The generated code assumes these values exist in JSON.
  @JsonKey(required: true)
  final int count;

  @JsonKey(required: true)
  final List<LocationDto> data;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory LocationResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseDtoFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LocationResponseDtoToJson(this);
}

// dart run build_runner build --delete-conflicting-outputs
