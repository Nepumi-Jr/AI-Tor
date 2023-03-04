import 'package:flutter/material.dart';
import 'info_card.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const infoCard(name: 'Fordcer', lv: 'Level 1 (1/100)', img: 'images/test.jpg', progress: '69%', motivateText: '"Keep Going!"');
  }

}