import 'package:json_annotation/json_annotation.dart';

part 'success_dto.g.dart';

@JsonSerializable()
class SuccessDto {
  SuccessDto({
    required this.response,
  });

  /// The generated code assumes these values exist in JSON.
  @JsonKey(required: true)
  final String response;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory SuccessDto.fromJson(Map<String, dynamic> json) =>
      _$SuccessDtoFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SuccessDtoToJson(this);
}

// dart run build_runner build --delete-conflicting-outputs
