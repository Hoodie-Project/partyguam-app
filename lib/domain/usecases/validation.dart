String? nicknameValidation(String? value) {
  final RegExp specialCharacters = RegExp('[^a-zA-Z0-9가-힣\\s]');

  /// TODO: 닉네임 중복 체크 추가
  if (specialCharacters.hasMatch(value!)) {
    return '특수문자는 사용할 수 없어요.';
  } else if (value.length < 2 || value.length > 15) {
    return '닉네임은 2자 이상 15자 이내로 입력해주세요.';
  }
  return null;
}

String? birthDateValidation(value) {
  final dateFormat = RegExp(r'^\d{4}-\d{2}-\d{2}$');
  final enteredDate = DateTime.tryParse(value);
  final currentDate = DateTime.now();
  final beforeDate = enteredDate?.isBefore(DateTime(1990, 1, 1));
  // final check = currentDate.isBefore(enteredDate);

  if (!dateFormat.hasMatch(value)) {
    return '생년월일을 다시 확인해 주세요.';
  }

  if (beforeDate! || currentDate.isBefore(enteredDate!)) {
    return '생년월일을 다시 확인해 주세요.';
  }

  return null;
}
