import 'package:flutter/material.dart';
import '../color_styles.dart';
import '../text_styles.dart';


class SpotCard extends StatelessWidget {

  final String title;
  final String? subtitle;

  const SpotCard({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //ElevatedButton.icon(onPressed: onPressed, label: )
      ],
    );
  }
}
