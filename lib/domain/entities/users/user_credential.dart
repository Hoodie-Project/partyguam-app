import 'package:equatable/equatable.dart';

class UserCredential extends Equatable {
  const UserCredential({
    required this.uid,
    required this.idToken,
  });

  final String uid;
  final String idToken;

  @override
  List<Object?> get props => [uid];
}

/// Equatable
/// Check if the data is unique dependents on the conditions.
/// In this case, if uid is the same, the data will be indicated as the same even if
/// idToken is different.
