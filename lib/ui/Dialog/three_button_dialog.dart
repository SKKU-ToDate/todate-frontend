
import 'package:flutter/material.dart';
import 'package:todate/ui/button/primary_button.dart';
import 'package:todate/ui/button/secondary_button.dart';
import '../../global/style/color_styles.dart';
import '../../global/style/text_styles.dart';

class ThreeButtonDialog extends StatelessWidget {

  final String title;
  final String content;
  final String button1Text;
  final String button2Text;
  final String button3Text;
  final VoidCallback? onConfirm;

  const ThreeButtonDialog({
    super.key,
    required this.title,
    required this.content,
    this.button1Text = 'button1',
    this.button2Text = 'button2',
    this.button3Text = 'button3',
    this.onConfirm,
  });
//todo
  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      backgroundColor: ColorStyles.neutralLightLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        //주석 벗기면 테두리 사라짐
        /*side: BorderSide(
          color: ColorStyles.neutralDark40,
          width: 1.5,
        ),*/
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
          child: Column(
            children: [
              SecondaryButton(
                text: button1Text,
                onPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(height: 8,),
              SecondaryButton(
                text: button2Text,
                onPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(height: 8,),
              PrimaryButton(
                text: button3Text,
                onPressed: () {
                  Navigator.of(context).pop();
                  onConfirm?.call();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
