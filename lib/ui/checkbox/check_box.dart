import 'package:flutter/material.dart';
import '../../global/style/color_styles.dart';

class BaseCheckBox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const BaseCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<BaseCheckBox> createState() => _BaseCheckBoxState();
}

class _BaseCheckBoxState extends State<BaseCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.value,
      onChanged: widget.onChanged,
      activeColor: ColorStyles.highlightDarkest,
      checkColor: Colors.white,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
