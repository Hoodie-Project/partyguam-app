enum ProvinceMockData {
  seoul('서울특별시', '서울특별시'),
  busan('busan', 'busan'),
  gyeoungki('경기도', '경기도'),
  daejeon('대전광역시', '대전광역시'),
  daegu('daegu', 'daegu');

  const ProvinceMockData(this.label, this.province);

  final String label;
  final String province;
}

class Player {
  String name = 'nico';
  int xp = 1500;
}

void main() {
  var player = Player();
  print(player.name);
  player.name = 'lalal';
  print(player.name);
}
