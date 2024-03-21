/// 인풋창에 글자가 하나 써지면 버튼 바로 활성화
/// 닉네임은 2자 이상 15자 이내, 특수 문자 불가, 중복 불가

String? NicknameValidator(value) {
  if (value == null || value.isEmpty) {
    return '닉네임을 입력하세요.';
  }
  return null;
}
