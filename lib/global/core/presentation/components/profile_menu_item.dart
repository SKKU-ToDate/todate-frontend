import 'package:flutter/material.dart';

import '../../../style/color_styles.dart';
import '../../../style/text_styles.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ProfileMenuItem({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyles.bodyM.copyWith(
                color: ColorStyles.neutralDarkDarkest,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 12,
              color: ColorStyles.neutralDarkLightest,
            ),
          ],
        ),
      ),
    );
  }
}
