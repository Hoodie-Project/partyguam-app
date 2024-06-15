import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:partyguam/core/index.dart';
import 'package:partyguam/presentation/index.dart';

import '../sign_up/styles.dart';

class Party1120 extends StatefulWidget {
  const Party1120({super.key});

  @override
  State<Party1120> createState() => _Party1120State();
}

class _Party1120State extends State<Party1120> {
  final _textController = TextEditingController();
  bool _showClearIcon = false;
  bool _isButtonDisabled = true;

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

  void _isTextFormEmpty() {
    setState(() {
      _isButtonDisabled = _textController.text.isEmpty;
    });
  }

  void _navigateToNextPage() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return _showApplicationDialog(context);
        });
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
      resizeToAvoidBottomInset: true,
      appBar: const ExitIconAppBar(
        title: '파티 생성하기',
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        double screenHeight = constraints.maxHeight;
        double screenWidth = constraints.maxWidth;

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                _buildPartyImage(),
                const SizedBox(height: 40),
                buildTitleText('파티명', '직관적인 파티명을 사용하시면 조회수가 올라가요.'),
                _buildPartyNameForm(),
                const SizedBox(height: 60),
                buildTitleText('파티 유형', '파티가 목표로 하는 유형을 선택해 주세요.'),
                _buildPartyTypeDropDownMenu(screenWidth),
                const SizedBox(height: 60),
                buildTitleText('파티 소개글', '파티의 방향성, 참고사항 등을 자유롭게 적어 주세요.'),
                _buildPartyIntroductionForm(),
                const SizedBox(height: 20),
                _buildNextButton(context),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildPartyImage() {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 160.0,
            height: 120.0,
            decoration: BoxDecoration(
              color: AppColors.primaryLightColors,
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          Positioned(
            bottom: -10,
            right: -10,
            child: Container(
              width: 32.0,
              height: 32.0,
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: AppColors.greyColors.shade100,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.primaryLightColors,
                child: Icon(
                  Icons.edit_outlined,
                  color: AppColors.greyColors.shade100,
                  size: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPartyNameForm() {
    return TextFormField(
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (PointerDownEvent event) {
        FocusScope.of(context).unfocus();
      },
      buildCounter: _buildPartyNameCounter,
      controller: _textController,
      maxLength: 15,
      maxLengthEnforcement: MaxLengthEnforcement.none,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: 20.0, top: 15.0, bottom: 15.0),
        hintText: '15자 이내로 입력해 주세요.',
        hintStyle: SignUpTextFormStyles.hintText,
        suffixIcon: _showClearIcon
            ? IconButton(
                icon: Icon(
                  Icons.cancel_outlined,
                  color: AppColors.greyColors.shade700,
                  size: 20.0,
                ),
                onPressed: () {
                  _clearText();
                },
              )
            : null,
        enabledBorder: SignUpTextFormStyles.enabledBorder,
        errorBorder: SignUpTextFormStyles.errorBorder,
        errorStyle: SignUpTextFormStyles.errorStyle,
        focusedBorder: SignUpTextFormStyles.focusedBorder,
        focusedErrorBorder: SignUpTextFormStyles.focusedErrorBorder,
      ),
    );
  }

  Widget _buildPartyNameCounter(
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

  Widget _buildPartyTypeDropDownMenu(double screenWidth) {
    return Center(
      child: DropdownMenu(
        width: MediaQuery.of(context).size.width * 0.9,
        menuStyle: MenuStyle(
          shape: WidgetStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              side: BorderSide(
                color: AppColors.primaryLightColors,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        dropdownMenuEntries:
            PartyTypes.values.map<DropdownMenuEntry<PartyTypes>>((element) {
          return DropdownMenuEntry(
            value: element,
            label: element.option,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPartyIntroductionForm() {
    return Scrollbar(
      interactive: true,
      radius: Radius.circular(16),
      child: TextFormField(
        scrollPadding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        controller: _textController,
        onTapOutside: (PointerDownEvent event) {
          FocusScope.of(context).unfocus();
        },
        minLines: null,
        maxLines: 10,
        maxLength: 250,
        buildCounter: _buildTextFormCounter,
        decoration: InputDecoration(
          hintText: hintText(),
          hintStyle: TextStyle(
            color: AppColors.greyColors.shade400,
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            letterSpacing: -0.25,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greyColors.shade200,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryDarkColors.shade100,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormCounter(
    BuildContext context, {
    required int currentLength,
    required int? maxLength,
    required bool isFocused,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '$currentLength / $maxLength',
          style: TextStyle(
            color: AppColors.greyColors.shade400,
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(width: 8.0),
        InkWell(
          onTap: () {
            _textController.clear();
          },
          child: Text(
            '전체삭제',
            style: TextStyle(
              color: currentLength > 0
                  ? AppColors.systemColors.shade100
                  : AppColors.greyColors.shade400,
            ),
          ),
        ),
      ],
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
          style: CommonButtonStyles.filledLongStyle,
          child: const Text('생성하기'),
        ),
      ),
    );
  }
}

Widget _showApplicationDialog(BuildContext context) {
  Widget buildTitleText() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, bottom: 23.0),
      child: Text(
        '지원 완료',
        style: TextStyle(
          color: AppColors.greyColors.shade700,
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget buildContentText() {
    return Text(
      '지원이 완료되었어요!\n다른 파티도 둘러볼까요?',
      style: TextStyle(
        color: AppColors.greyColors.shade700,
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              context.pop();
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primaryLightColors.shade400,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                ),
              ),
              height: 48,
              child: Text(
                '지원 목록',
                style: TextStyle(
                  color: AppColors.greyColors.shade700,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              context.go(RouterPath.main);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16.0),
                ),
                color: AppColors.primaryLightColors,
              ),
              height: 48.0,
              child: Text(
                '확인',
                style: TextStyle(
                  color: AppColors.greyColors.shade700,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: Stack(
      children: [
        Container(
          height: 200.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: AppColors.greyColors.shade50,
          ),
          child: Column(
            children: [
              buildTitleText(),
              buildContentText(),
              const Expanded(
                child: SizedBox(),
              ),
              buildButtons(),
            ],
          ),
        ),
      ],
    ),
  );
}
