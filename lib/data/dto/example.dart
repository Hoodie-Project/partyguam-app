import 'dart:convert';

import '../../core/index.dart';
import '../../domain/index.dart';

class ExampleDto extends UserCredential {
  const ExampleDto({
    required super.uid,
    required super.idToken,
  });

  /// When it receives the data,
  /// it's in a form of JSON with data type String.
  factory ExampleDto.fromJson(String source) =>
      ExampleDto.fromMap(jsonDecode(source) as Data);

  ExampleDto.fromMap(Data map)
      : this(
          uid: map['uid'] as String,
          idToken: map['idToken'] as String,
        );

  Data toMap() => {
        'uid': uid,
        'idToken': idToken,
      };

  String toJson() => jsonEncode(toMap());
}
