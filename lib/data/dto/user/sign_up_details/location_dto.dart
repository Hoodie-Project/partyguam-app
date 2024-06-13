import 'package:json_annotation/json_annotation.dart';

part 'location_dto.g.dart';

@JsonSerializable()
class LocationDto {
  LocationDto({required this.id, required this.province, required this.city});

  /// The generated code assumes these values exist in JSON.
  @JsonKey(required: true)
  final int id;

  @JsonKey(required: true)
  final String province;

  @JsonKey(required: true)
  final String city;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LocationDtoToJson(this);
}

// dart run build_runner build --delete-conflicting-outputs
