import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/index.dart';
import '../../../../data/index.dart';
import '../../../../domain/index.dart';
import '../../../../main.dart';

part 'user_state.dart';

@Injectable()
class UserCubit extends Cubit<UserState> {
  UserCubit({
    required CheckUserNickname checkUserNickname,
    required SendUserCredentials sendUserCredentials,
    required DioClient dioClient,
  })  : _checkUserNickname = checkUserNickname,
        _sendUserCredentials = sendUserCredentials,
        _dioClient = dioClient,
        super(const UserInitial());

  final CheckUserNickname _checkUserNickname;
  final SendUserCredentials _sendUserCredentials;
  final DioClient _dioClient;

  void resetUserCubitState() {
    emit(const UserInitial());
  }

  Future<void> sendUserCredentials(String uid) async {
    final idToken = localStorage.getString('kakaoIdToken');

    final result = await _sendUserCredentials(
      SendUserCredentialParams(uid: uid, idToken: idToken!),
    );

    result.fold(
      (failure) => emit(const SendUserCredentialsSuccess()),
      (success) => emit(const SendUserCredentialsSuccess()),
    );
  }

  Future<void> isUserRegistered() async {
    try {
      final result = await _dioClient.checkCookie();

      if (result != null) {
        if (result.token == TokenTypes.register.token) {
          emit(const Unregistered());
        } else if (result.token == TokenTypes.login.token) {
          emit(const Registered());
        }
      }
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<String?> checkUserNickname(String nickname) async {
    emit(const CheckUserNicknamePending());

    final result = await _checkUserNickname(
      CheckUserNicknameParams(nickname: nickname),
    );

    result.fold(
      (failure) => emit(const NicknameUnavailable()),
      (success) => emit(const NicknameAvailable()),
    );
  }
}
