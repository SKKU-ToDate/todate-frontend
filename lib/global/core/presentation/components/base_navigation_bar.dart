import 'package:flutter/material.dart';
import 'package:todate/global/style/text_styles.dart';

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
      labelTextStyle: WidgetStatePropertyAll<TextStyle>(TextStyles.actionS),
      destinations: destinations,
    );
  }
}
