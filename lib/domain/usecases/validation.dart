String? nicknameValidation(String? value) {
  final RegExp specialCharacters = RegExp('[^a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣\\s]');

  /// TODO: 닉네임 중복 체크 추가
  if (specialCharacters.hasMatch(value!)) {
    return '특수문자는 사용할 수 없어요.';
  } else if (value.length < 2 || value.length > 15) {
    return '닉네임은 2자 이상 15자 이내로 입력해주세요.';
  }
  return null;
}

String? birthDateValidation(value) {
  final birthDateFormat = RegExp(r'^\d{4}-\d{2}-\d{2}$');
  final RegExp yearRegex = RegExp(r'^((19\d{2})|([2-9]\d{3}))$');
  final RegExp monthFormat = RegExp(r'^(0[1-9]|1[0-2])$');

  /// TODO: 윤년 고려한 예외처리 필요
  final RegExp dayFormat =
      RegExp(r'^(0[1-9]|[12]\d|(?:3[01]|(?:0?[1-9]|1\d|2[0-8])))$');

  final dateSplit = value.split('-');

  if (!birthDateFormat.hasMatch(value)) {
    return '생년월일을 다시 확인해 주세요.';
  } else if (!yearRegex.hasMatch(dateSplit[0])) {
    return '생년월일을 다시 확인해 주세요.';
  } else if (!monthFormat.hasMatch(dateSplit[1])) {
    return '생년월일을 다시 확인해 주세요.';
  } else if (!dayFormat.hasMatch(dateSplit[2])) {
    return '생년월일을 다시 확인해 주세요.';
  }
  return null;
}
