
import 'package:flutter/material.dart';
import '../color_styles.dart';
import '../text_styles.dart';

//버튼 색을 눌렀을때 highlight40 아닐때 highlight100으로 정함
//버튼 weight 는 무한, height는 40으로 고정


class PrimaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;


  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {



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
          color: isPressed ?  ColorStyles.highlight40 : ColorStyles.highlight100,
        ),
        child: Text(
                widget.text,
                style: TextStyles.actionMSemiBold.copyWith(color: ColorStyles.neutralLight20),
              )
      ),
    );
  }
}
