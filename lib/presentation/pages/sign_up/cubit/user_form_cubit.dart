import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/index.dart';
import 'user_cubit.dart';

part 'user_form_state.dart';

@Injectable()
class UserFormCubit extends Cubit<UserFormState> {
  UserFormCubit({
    required CreateUser createUser,
  })  : _createUser = createUser,
        super(const UserFormState());

  final CreateUser _createUser;

  void setEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void setNickname(String nickname) {
    emit(state.copyWith(nickname: nickname));
  }

  void setBirth(String birth) {
    emit(state.copyWith(birth: birth));
  }

  void setGender(String gender) {
    emit(state.copyWith(gender: gender));
  }

  Future<void> createUser() async {
    emit(state.copyWith(createUserComplete: false));

    final result = await _createUser(
      CreateUserParams(
        email: state.email,
        nickname: state.nickname,
        birth: state.birth,
        gender: state.gender,
      ),
    );

    result.fold(
      (failure) => UserError(failure.message),
      (success) => emit(state.copyWith(createUserComplete: true)),
    );
  }
}
