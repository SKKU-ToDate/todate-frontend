import 'package:flutter/material.dart';
import 'package:todate/global/style/text_styles.dart';

import '../../../style/color_styles.dart';

class BaseNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) handleDestinationSelected;
  final List<NavigationDestination> destinations;

  const BaseNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.handleDestinationSelected,
    required this.destinations,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: Colors.transparent,
      selectedIndex: selectedIndex,
      onDestinationSelected: handleDestinationSelected,
      height: 62,
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
        final bool isSelected = states.contains(WidgetState.selected);
        final Color textColor = isSelected
            ? ColorStyles
                  .neutralDarkDarkest // 선택 시
            : ColorStyles.neutralDarkLight; // 비선택 시
        return TextStyles.actionS.copyWith(color: textColor);
      }),
      destinations: destinations,
    );
  }
}
