import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/index.dart';

part 'auth_event.dart';
part 'auth_state.dart';

/// https://youtu.be/_E3EF1jPumM?si=NOpVOasJ2RLaU4ux&t=20450
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    /// named constructors: to know what I have and where I give it to them
    required SendUserCredentials sendUserCredentials,
  })  : _sendUserCredentials = sendUserCredentials,

        /// initiate _userCredential to userCredential
        super(const AuthInitial()) {
    on<SendUserCredentialsEvent>(_sendUserCredentialsHandler);
  }

  final SendUserCredentials _sendUserCredentials;

  Future<void> _sendUserCredentialsHandler(
    SendUserCredentialsEvent event,
    Emitter<AuthState> emit,
  ) async {
    /// set loading state
    emit(const SendingUserCredentials());

    /// invoke the usecase
    final result = await _sendUserCredentials();

    /// equatable syntax: result.fold(L,R)

    result.fold(
        (registered) => emit(AuthRegisteredToken(registered.signUpAccessToken)),
        (r) => emit(const UserCredentialsSent()));
  }
}

/*
* 이벤트를 통해 비즈니스 로직과 UI 로직을 분리할 수 있습니다.
* 이벤트는 상태 전환의 원인을 나타내고, 상태 전환 로직은 Bloc 내부에서 처리됩니다.
* */
