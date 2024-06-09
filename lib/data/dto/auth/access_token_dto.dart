import 'package:json_annotation/json_annotation.dart';

part 'access_token_dto.g.dart';

@JsonSerializable()
class AccessTokenDto {
  AccessTokenDto({
    required this.accessToken,
  });

  /// The generated code assumes these values exist in JSON.
  @JsonKey(required: true)
  final String accessToken;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory AccessTokenDto.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenDtoFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AccessTokenDtoToJson(this);
}

// dart run build_runner build --delete-conflicting-outputs
