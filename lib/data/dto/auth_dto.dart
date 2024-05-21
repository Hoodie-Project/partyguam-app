import 'package:json_annotation/json_annotation.dart';

part 'auth_dto.g.dart';

@JsonSerializable()
class AuthDto {
  /// The generated code assumes these values exist in JSON.
  @JsonKey(required: true)
  final String accessToken;

  @JsonKey(required: true)
  final String refreshToken;

  AuthDto({required this.accessToken, required this.refreshToken});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory AuthDto.fromJson(Map<String, dynamic> json) =>
      _$AuthDtoFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AuthDtoToJson(this);
}

// dart run build_runner build --delete-conflicting-outputs
