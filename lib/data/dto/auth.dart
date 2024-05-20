import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@JsonSerializable()
class Auth {
  /// The generated code assumes these values exist in JSON.
  @JsonKey(required: true)
  final String accessToken;

  @JsonKey(required: true)
  final String refreshToken;

  Auth({required this.accessToken, required this.refreshToken});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AuthToJson(this);
}

// dart run build_runner build --delete-conflicting-outputs
