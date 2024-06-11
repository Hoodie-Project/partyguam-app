import 'package:flutter/material.dart';
import 'package:partyguam/presentation/routes/route_path.dart';
import 'package:partyguam/presentation/theme/colors.dart';
import 'package:partyguam/presentation/widgets/app_bar.dart';
import 'package:partyguam/presentation/widgets/buttons.dart';
import 'package:partyguam/presentation/widgets/text.dart';

class Party1150 extends StatefulWidget {
  const Party1150({super.key});

  @override
  State<Party1150> createState() => _Party1150State();
}

class _Party1150State extends State<Party1150> {
  final textController = TextEditingController();

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
            buildFilledLongButton(context, '지원하기', RouterPath.main),
          ],
        ),
      ),
    );
  }

  Widget _buildTextForm() {
    return TextFormField(
      controller: textController,
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
            textController.clear();
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
}
