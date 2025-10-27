import 'package:flutter/material.dart';
import '../../global/style/color_styles.dart';
import '../../global/style/text_styles.dart';

class BaseTextField extends StatelessWidget {

  final String? label;
  final String placeHolder;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const BaseTextField({
    super.key,
    this.label,
    required this.placeHolder,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5,),
        if(label != null)
          Text(label!, style: TextStyles.bodyM,),
        TextField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: ColorStyles.neutralLightDarkest)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: ColorStyles.highlightDarkest)
            ),
            hintText: placeHolder,
            hintStyle: TextStyle(color: ColorStyles.neutralLightDarkest),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
        )
      ],
    );
  }
}
