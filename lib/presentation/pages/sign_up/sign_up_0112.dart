import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/index.dart';
import '../../../../domain/usecases/validation.dart';
import '../../index.dart';
import 'styles.dart';

class SignUp0112 extends StatefulWidget {
  const SignUp0112({super.key});

  @override
  State<SignUp0112> createState() => _SignUp0112State();
}

class _SignUp0112State extends State<SignUp0112> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();

  bool _showClearIcon = false;
  bool _isButtonDisabled = true;
  String? error;
  int maxLength = 15;

  @override
  void initState() {
    super.initState();

    _textController.addListener(_updateClearIconVisibility);
    _textController.addListener(_isTextFormEmpty);
  }

  void _updateClearIconVisibility() {
    setState(() {
      _showClearIcon = _textController.text.isNotEmpty;
    });
  }

  void _clearText() {
    setState(() {
      _textController.clear();
    });
  }

  _isTextFormEmpty() {
    setState(() {
      _isButtonDisabled = _textController.text.isEmpty;
    });
  }

  _navigateToNextPage() {
    final nickname = _textController.text;

    if (_formKey.currentState!.validate()) {
      context.read<UserCubit>().checkUserNickname(nickname);
      context.read<UserFormCubit>().setNickname(nickname);
    }
  }

  @override
  void dispose() {
    _textController.removeListener(_updateClearIconVisibility);
    _textController.removeListener(_isTextFormEmpty);
    _textController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SignUpAppBar(
        title: '가입하기',
        pageCount: '2/4',
      ),
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is NicknameUnavailable) {
            error = NicknameError.duplicate.error;
            _formKey.currentState!.validate();
          } else if (state is NicknameAvailable) {
            context.push('${RouterPath.signUp}/0113');
          } else if (state is UserInitial) {
            error = null;
            return;
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(
                left: 20.0, top: 40.0, right: 20.0, bottom: 12.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTitleText(
                    '어떻게 불러드리면 될까요?\n닉네임을 입력해 주세요',
                    '닉네임은 나중에 변경할 수 없어요.',
                  ),
                  _buildNickNameForm(),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  _buildNextButton(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNickNameForm() {
    return SizedBox(
      width: double.infinity,
      child: Form(
        key: _formKey,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          autofocus: true,
          buildCounter: _buildCounter,
          controller: _textController,
          maxLength: 15,
          maxLengthEnforcement: MaxLengthEnforcement.none,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 20.0, top: 15.0, bottom: 15.0),
            hintText: '15자 이내로 입력해 주세요. (영문/숫자/한글)',
            hintStyle: SignUpTextFormStyles.hintText,
            suffixIcon: _showClearIcon
                ? IconButton(
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: AppColors.greyColors.shade700,
                      size: 20.0,
                    ),
                    onPressed: () {
                      setState(() {
                        context.read<UserCubit>().resetUserCubitState();
                        _clearText();
                      });
                    },
                  )
                : null,
            enabledBorder: SignUpTextFormStyles.enabledBorder,
            errorBorder: SignUpTextFormStyles.errorBorder,
            errorStyle: SignUpTextFormStyles.errorStyle,
            focusedBorder: SignUpTextFormStyles.focusedBorder,
            focusedErrorBorder: SignUpTextFormStyles.focusedErrorBorder,
          ),
          validator: (String? value) {
            return nicknameValidation(value, error);
          },
        ),
      ),
    );
  }

  Widget _buildCounter(
    BuildContext context, {
    required int currentLength,
    required int? maxLength,
    required bool isFocused,
  }) {
    Color textColor = currentLength > maxLength! ? Colors.red : Colors.black;

    return Text(
      '$currentLength / $maxLength',
      style: TextStyle(
        color: textColor,
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: AppColors.greyColors.shade50,
        elevation: 1.0,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        child: ElevatedButton(
          onPressed: _isButtonDisabled ? null : _navigateToNextPage,
          style: CommonButtonStyles.filledLongStyle,
          child: const Text('다음'),
        ),
      ),
    );
  }
}
