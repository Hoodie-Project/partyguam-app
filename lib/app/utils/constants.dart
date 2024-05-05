enum Time {
  morning('오전', '(6시 - 12시)'),
  afternoon('오후', '(12시 - 18시)'),
  night('저녁', '(18시 - 24시)'),
  dawn('새벽', '(24시 - 6시)'),
  allTime('무관', '');

  const Time(this.label, this.hours);

  final String label;
  final String hours;
}

enum Personality {
  option1('계획에 따른 체계적인 실행이 중요해요'),
  option2('계획을 따르지만 유연한 실행이 중요해요');

  const Personality(this.option);

  final String option;
}

enum ConfidentList {
  option1('기술적인 역량과 전문 지식을 가지고 있어요.'),
  option2('효율적으로 일을 처리할 수 있어요.'),
  option3('시간관리 능력이 뛰어나요.'),
  option4('문제 해결 능력이 뛰어나요.'),
  option5('창의적인 아이디어가 많아요.'),
  option6('소통과 협업에 자신있어요.');

  const ConfidentList(this.option);

  final String option;
}
