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

enum Confident {
  option1('기술적인 역량과 전문 지식을 가지고 있어요.'),
  option2('효율적으로 일을 처리할 수 있어요.'),
  option3('시간관리 능력이 뛰어나요.'),
  option4('문제 해결 능력이 뛰어나요.'),
  option5('창의적인 아이디어가 많아요.'),
  option6('소통과 협업에 자신있어요.');

  const Confident(this.option);

  final String option;
}

enum Challenge {
  option1('새로운 기술 및 업무에 도전하고 싶어요.'),
  option2('해당 분야의 경력을 쌓고 싶어요.'),
  option3('어려운 문제 및 상황을 풀어나가고 싶어요.'),
  option4('리더십 역량을 기르고 싶어요.'),
  option5('제한된 시간에서 능력을 확인하고 싶어요.');

  const Challenge(this.option);

  final String option;
}

enum Province {
  option1('서울'),
  option2('경기'),
  option3('인천'),
  option4('강원'),
  option5('충북'),
  option6('충남'),
  option7('전북'),
  option8('전남');

  const Province(this.option);

  final String option;
}

enum City {
  option1('전체'),
  option2('강북구'),
  option3('강남구'),
  option4('강서구'),
  option5('관악구'),
  option6('광진구'),
  option7('구로구'),
  option8('노원구'),
  option9('도봉구'),
  option10('동작구'),
  option11('동대문구'),
  option12('사상구'),
  option13('사하구'),
  option14('중구'),
  option15('동구'),
  option16('서구');

  const City(this.option);

  final String option;
}

enum Address {
  option1('서울', '전체'),
  option2('서울', '강북구'),
  option3('서울', '강남구'),
  option4('서울', '강서구'),
  option5('서울', '관악구'),
  option6('서울', '광진구'),
  option7('서울', '구로구'),
  option8('서울', '노원구'),
  option9('서울', '도봉구'),
  option10('서울', '동작구'),
  option11('서울', '동대문구'),
  option12('서울', '사상구'),
  option13('서울', '사하구'),
  option14('서울', '중구'),
  option15('서울', '동구'),
  option16('서울', '서구');

  const Address(this.province, this.city);

  final String province;
  final String city;
}

enum NicknameError {
  duplicate('duplicate', '중복된 닉네임 이에요.'),
  specialCharacter('specialCharacter', '특수문자는 사용할 수 없어요.'),
  length('length', '닉네임은 2자 이상 15자 이내로 입력해주세요.');

  const NicknameError(this.error, this.description);

  final String error;
  final String description;
}
