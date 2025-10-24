import 'package:flutter/material.dart';
import '../color_styles.dart';
import '../text_styles.dart';

class SecondaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onPressed();  // onPressed 콜백 실행
        setState(() {
          isPressed = !isPressed;  // 눌렸을 때 색상 반전
        });
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return ColorStyles.neutralLight60; // 눌렸을 때 색상
            }
            return ColorStyles.neutralLight20; // 기본 색상
          },
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        side: WidgetStateProperty.all(
          BorderSide(
            color: ColorStyles.highlight100,
            width: 1.5,
          ),
        ),
        minimumSize: WidgetStateProperty.all(Size(double.infinity, 40)),
      ),
      child: Text(
        widget.text,
        style: TextStyles.actionMSemiBold.copyWith(color: ColorStyles.highlight100),
      ),
    );
  }
}
