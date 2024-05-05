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
