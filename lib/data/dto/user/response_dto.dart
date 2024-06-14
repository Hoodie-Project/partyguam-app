import 'package:json_annotation/json_annotation.dart';

part 'response_dto.g.dart';

@JsonSerializable()
class ResponseDto {
  ResponseDto({
    required this.response,
  });

  /// The generated code assumes these values exist in JSON.
  @JsonKey(required: true)
  final String response;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory ResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ResponseDtoFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ResponseDtoToJson(this);
}

// dart run build_runner build --delete-conflicting-outputs
