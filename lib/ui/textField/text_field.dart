import 'package:flutter/material.dart';
import '../color_styles.dart';
import '../text_styles.dart';

class BaseTextField extends StatelessWidget {

  final String label;
  final String placeHolder;
  final TextEditingController? controller;

  const BaseTextField({
    super.key,
    required this.label,
    required this.placeHolder,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5,),
        Text(label, style: TextStyles.bodyMRegular,),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: ColorStyles.neutralLight100)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: ColorStyles.highlight100)
            ),
            hintText: placeHolder,
            hintStyle: TextStyle(color: ColorStyles.neutralLight100)
          ),
        )
      ],
    );
  }
}
