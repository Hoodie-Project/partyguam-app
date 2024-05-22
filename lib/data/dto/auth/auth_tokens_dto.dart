import 'package:json_annotation/json_annotation.dart';

part 'auth_tokens_dto.g.dart';

@JsonSerializable()
class AuthTokensDto {
  AuthTokensDto({
    required this.accessToken,
    required this.refreshToken,
  });

  /// The generated code assumes these values exist in JSON.
  @JsonKey(required: true)
  final String accessToken;

  @JsonKey(required: true)
  final String refreshToken;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory AuthTokensDto.fromJson(Map<String, dynamic> json) =>
      _$AuthTokensDtoFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AuthTokensDtoToJson(this);
}

// dart run build_runner build --delete-conflicting-outputs
