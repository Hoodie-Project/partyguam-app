import 'package:json_annotation/json_annotation.dart';

part 'response_wrapper.g.dart';

@JsonSerializable()
class ResponseWrapper {
  ResponseWrapper({
    required this.data,
  });

  /// The generated code assumes these values exist in JSON.
  @JsonKey(required: true)
  final Map<String, dynamic> data;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory ResponseWrapper.fromJson(Map<String, dynamic> json) =>
      _$ResponseWrapperFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ResponseWrapperToJson(this);
}

// dart run build_runner build --delete-conflicting-outputs
