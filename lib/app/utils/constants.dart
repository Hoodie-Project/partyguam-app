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
