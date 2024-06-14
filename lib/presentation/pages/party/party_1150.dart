import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../index.dart';

class Party1150 extends StatefulWidget {
  const Party1150({super.key});

  @override
  State<Party1150> createState() => _Party1150State();
}

class _Party1150State extends State<Party1150> {
  final _textController = TextEditingController();
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();

    _textController.addListener(_isTextFormEmpty);
  }

  void _navigateToNextPage() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return _showApplicationDialog(context);
        });
  }

  void _isTextFormEmpty() {
    setState(() {
      _isButtonDisabled = _textController.text.isEmpty;
    });
  }

  @override
  void dispose() {
    _textController.removeListener(_isTextFormEmpty);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const ExitIconAppBar(title: '파티 지원하기'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitleText('지원 사유', '250자 이내로 자유롭게 작성해 주세요.'),
            _buildTextForm(),
            const Expanded(child: SizedBox()),
            _buildNextButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTextForm() {
    return TextFormField(
      controller: _textController,
      onTapOutside: (PointerDownEvent event) {
        FocusScope.of(context).unfocus();
      },
      minLines: null,
      maxLines: 15,
      maxLength: 250,
      buildCounter: (
        BuildContext context, {
        required int currentLength,
        required int? maxLength,
        required bool isFocused,
      }) =>
          _buildTextFormCounter(currentLength, maxLength),
      decoration: InputDecoration(
        hintText: '지원 사유를 작성해 주세요.',
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
    );
  }

  Widget _buildTextFormCounter(
    int currentLength,
    int? maxLength,
  ) {
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
          child: const Text('지원하기'),
        ),
      ),
    );
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
}
