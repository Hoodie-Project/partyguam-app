import 'package:json_annotation/json_annotation.dart';

part 'user_credential_dto.g.dart';

@JsonSerializable()
class UserCredentialDto {
  UserCredentialDto({
    required this.uid,
    required this.idToken,
  });

  /// The generated code assumes these values exist in JSON.
  @JsonKey(required: true)
  final String uid;

  @JsonKey(required: true)
  final String idToken;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory UserCredentialDto.fromJson(Map<String, dynamic> json) =>
      _$UserCredentialDtoFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserCredentialDtoToJson(this);
}

// dart run build_runner build --delete-conflicting-outputs
