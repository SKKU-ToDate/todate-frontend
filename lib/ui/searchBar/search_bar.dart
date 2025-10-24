import 'package:flutter/material.dart';
import '../../global/style/color_styles.dart';
import '../../global/style/text_styles.dart';

class BaseSearchBar extends StatelessWidget {

  final String placeHolder;
  final TextEditingController? controller;

  const BaseSearchBar({
    super.key,
    required this.placeHolder,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchBar(
            constraints: const BoxConstraints(
              minHeight: 44,
              maxHeight: 44,
            ),
            shape: const WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24)),
              ),
            ),
            leading: const Icon(Icons.search),
            hintText: placeHolder,
            hintStyle: WidgetStatePropertyAll(
              TextStyles.bodyM.copyWith(
                color: ColorStyles.neutralLightDarkest,
              ),
            ),
            elevation: const WidgetStatePropertyAll(0),
            ),
      ],
    );
  }
}
