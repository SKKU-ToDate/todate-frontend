
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
    return ElevatedButton(
      onPressed: () {
        widget.onPressed();
        setState(() {
        isPressed = !isPressed;
        });
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return ColorStyles.highlight40;
            }
            return ColorStyles.highlight100;
          },
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        minimumSize: WidgetStateProperty.all(Size(double.infinity, 40)),
      ),
      child: Text(
        widget.text,
        style: TextStyles.actionMSemiBold.copyWith(color: ColorStyles.neutralLight20),
      ),
    );
  }
}
