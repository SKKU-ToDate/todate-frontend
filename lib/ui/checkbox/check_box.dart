
import 'package:flutter/material.dart';
import '../color_styles.dart';


class CheckBox extends StatefulWidget {


  const CheckBox({
    super.key,
  });

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          value = !value;
        });
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: ColorStyles.highlight100, width: 1.5),
          color: value ? ColorStyles.highlight100 : ColorStyles.neutralLight20,
        ),
        alignment: Alignment.center,
        child: value
            ? Icon(Icons.check, color: Colors.white, size: 18)
            : null,
      ),
    );
  }
}
