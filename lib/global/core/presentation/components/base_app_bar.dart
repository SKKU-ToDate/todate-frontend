import 'package:flutter/material.dart';
import 'package:todate/global/style/color_styles.dart';
import 'package:todate/global/style/text_styles.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final Widget? action;

  const BaseAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.action,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: TextStyles.heading4.copyWith(
          color: ColorStyles.neutralDarkDarkest,
        ),
      ),
      leading: showBackButton
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: ColorStyles.highlightDarkest,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      actions: action != null ? [action!] : null,
    );
  }
}
