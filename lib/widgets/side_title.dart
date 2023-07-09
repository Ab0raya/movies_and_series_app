import 'package:flutter/material.dart';

import '../helper/colors.dart';

class SideTitle extends StatelessWidget {
  const SideTitle({super.key, required this.text});
  final String text ;

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: const TextStyle(
          color: a6, fontSize: 22, fontWeight: FontWeight.w500),
    );
  }
}
