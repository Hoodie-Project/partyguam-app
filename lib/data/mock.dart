import 'package:flutter/material.dart';

List<Map<String, String>> AddressMockData = [
  {"province": "서울특별시", "city": "광진구"},
  {"province": "서울특별시", "city": "성동구"},
  {"province": "부산광역시", "city": "사상구"},
  {"province": "부산광역시", "city": "진구"},
  {"province": "경기도", "city": "일산시"},
];

enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Orange', Colors.orange),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);

  final String label;
  final Color color;
}
