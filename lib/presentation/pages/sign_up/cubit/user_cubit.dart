import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/index.dart';

part 'user_state.dart';

@Injectable()
class UserCubit extends Cubit<UserState> {
  UserCubit({
    required CheckUserNickname checkUserNickname,
  })  : _checkUserNickname = checkUserNickname,
        super(const UserInitial());

  final CheckUserNickname _checkUserNickname;

  void resetUserCubitStatus() {
    emit(const UserInitial());
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
