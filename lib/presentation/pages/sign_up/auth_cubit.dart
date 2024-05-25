import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/index.dart';

part 'auth_state.dart';

/// https://youtu.be/_E3EF1jPumM?si=HVcf7QQSA7Q1SwcN&t=21554
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    /// named constructors: to know what I have and where I give it to them
    required SendUserCredentials sendUserCredentials,
  })  : _sendUserCredentials = sendUserCredentials,
        super(const AuthInitial());

  final SendUserCredentials _sendUserCredentials;

  Future<void> sendUserCredentials({
    required String uid,
    required String idToken,
  }) async {
    /// set loading state
    emit(const SendingUserCredentials());

    /// invoke the usecase
    final result = await _sendUserCredentials(
      SendUserCredentialParams(
        uid: uid,
        idToken: idToken,
      ),
    );

    /// equatable syntax: result.fold(L,R)

    result.fold(
        (registered) => emit(AuthRegisteredToken(registered.signUpAccessToken)),
        (r) => emit(const UserCredentialsSent()));
  }
}

/*
* cubit
* no event.
* */
