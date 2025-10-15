import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todate/ui/button/primary_button.dart';
import 'package:todate/ui/button/secondary_button.dart';
import 'package:todate/ui/button/terciary_button.dart';
import '../color_styles.dart';
import '../text_styles.dart';

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

      backgroundColor: ColorStyles.neutralLight40,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: ColorStyles.neutralDark40,
          width: 1.5,
        ),
      ),
      title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyles.headingH3ExtraBold,
      ),
      content: Text(content,
        style: TextStyles.bodySRegular.copyWith(color: ColorStyles.neutralDark40),
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
