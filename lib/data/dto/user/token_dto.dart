import 'package:json_annotation/json_annotation.dart';

part 'token_dto.g.dart';

@JsonSerializable()
class TokenDto {
  TokenDto({
    required this.token,
    required this.value,
  });

  /// The generated code assumes these values exist in JSON.
  @JsonKey(required: true)
  final String token;

  @JsonKey(required: true)
  final String value;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory TokenDto.fromJson(Map<String, dynamic> json) =>
      _$TokenDtoFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TokenDtoToJson(this);
}

// dart run build_runner build --delete-conflicting-outputs
