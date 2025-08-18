
import 'package:flutter/material.dart';
import '../color_styles.dart';
import '../text_styles.dart';





class TerciaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;


  const TerciaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<TerciaryButton> createState() => _TerciaryButtonState();
}

class _TerciaryButtonState extends State<TerciaryButton> {


  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_){
        setState(() {
          isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },

      child: Container(
          height: 40,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isPressed ?  ColorStyles.neutralLight60 : ColorStyles.neutralLight20,
          ),
          child: Text(
            widget.text,
            style: TextStyles.actionMSemiBold.copyWith(color: ColorStyles.highlight100),
          )
      ),
    );
  }
}
