import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../domain/usecases/validation.dart';
import '../../../theme/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/text.dart';
import 'styles.dart';

class SignUp0113 extends StatefulWidget {
  const SignUp0113({super.key});

  @override
  State<SignUp0113> createState() => _SignUp0113State();
}

class _SignUp0113State extends State<SignUp0113> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  final _maskFormatter = MaskTextInputFormatter(
    mask: '####-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  bool _showClearIcon = false;
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();

    _textController.addListener(_updateClearIconVisibility);
    _textController.addListener(_isTextFormEmpty);
  }

  @override
  void dispose() {
    _textController.removeListener(_updateClearIconVisibility);
    _textController.dispose();

    super.dispose();
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

  void _isTextFormEmpty() {
    setState(() {
      _isButtonDisabled = _textController.text.isEmpty;
    });
  }

  void _navigateToNextPage() {
    if (_formKey.currentState!.validate()) {
      context.push('/sign_up/0114');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SignUpAppBar(
        title: '가입하기',
        pageCount: '3/4',
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, top: 40.0, right: 20.0, bottom: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleText(
                mainTitle: '***님의\n생년월일을 알려주세요.',
                subTitle: '프로필에서 노출 여부를 설정할 수 있어요.'),
            _buildBirthDateForm(),
            const Expanded(
              child: SizedBox(),
            ),
            _buildNextButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBirthDateForm() {
    return SizedBox(
      width: double.infinity,
      child: Form(
        key: _formKey,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          autofocus: true,
          controller: _textController,
          inputFormatters: [_maskFormatter],
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 20.0, top: 15.0, bottom: 15.0),
            counterText: '',
            hintText: '8자리를 입력해 주세요. (ex. 1990-12-31)',
            hintStyle: TextStyle(
              color: AppColors.greyColors.shade400,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
            suffixIcon: _showClearIcon
                ? IconButton(
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: AppColors.greyColors.shade700,
                      size: 20.0,
                    ),
                    onPressed: () {
                      setState(() {
                        _clearText();
                      });
                    },
                  )
                : null,
            errorStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12.0,
            ),
            enabledBorder: TextFormBorderStyles.enabledBorder,
            focusedBorder: TextFormBorderStyles.focusedBorder,
            errorBorder: TextFormBorderStyles.errorBorder,
            focusedErrorBorder: TextFormBorderStyles.focusedErrorBorder,
          ),
          maxLength: 10,
          keyboardType: TextInputType.datetime,
          validator: (String? value) {
            return birthDateValidation(value);
          },
        ),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: AppColors.greyColors.shade50,
        elevation: 1.0,
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
        child: ElevatedButton(
          onPressed: _isButtonDisabled ? null : _navigateToNextPage,
          style: ButtonStyles.filledLongStyle,
          child: const Text('다음'),
        ),
      ),
    );
  }
}
