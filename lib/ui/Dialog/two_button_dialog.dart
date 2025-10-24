
import 'package:flutter/material.dart';
import 'package:todate/ui/button/primary_button.dart';
import 'package:todate/ui/button/secondary_button.dart';
import '../../global/style/color_styles.dart';
import '../../global/style/text_styles.dart';

class TwoButtonDialog extends StatelessWidget {

  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final VoidCallback? onConfirm;

  const TwoButtonDialog({
    super.key,
    required this.title,
    required this.content,
    this.confirmText = 'button2',//기본값을 확인 취소로 하고 나머지 받을 수 있습니다.
    this.cancelText = 'button1',
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      backgroundColor: ColorStyles.neutralLightLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        //주석 벗기면 테두리 사라짐
        // side: BorderSide(
        //   color: ColorStyles.neutralDark40,
        //   width: 1.5,
        // ),
      ),
      title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyles.heading3,
      ),
      content: Text(content,
        style: TextStyles.bodyS.copyWith(color: ColorStyles.neutralDarkLight),
        textAlign: TextAlign.center,
        softWrap: true,
        overflow: TextOverflow.visible,
      ),
      actionsPadding: EdgeInsets.zero,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: SecondaryButton(
                  text: cancelText,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: PrimaryButton(
                  text: confirmText,
                  onPressed: () {
                    Navigator.of(context).pop();
                    onConfirm?.call();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
