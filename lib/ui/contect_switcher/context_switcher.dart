import 'package:flutter/material.dart';

import '../../global/style/color_styles.dart';
import '../../global/style/text_styles.dart';

class ContextSwitcher extends StatefulWidget {
  final List<String> text;
  final ValueChanged<int> onIndexChanged;

  const ContextSwitcher({
    super.key,
    required this.text,
    required this.onIndexChanged,
  });

  @override
  _ContextSwitcherState createState() => _ContextSwitcherState();
}

class _ContextSwitcherState extends State<ContextSwitcher> {
  int selectedIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onIndexChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 39,
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: ColorStyles.neutralLightLight,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              _SwitchButton(
                text: widget.text[0],
                isSelected: selectedIndex == 0,
                onTap: () => onTabSelected(0),
              ),
              _SwitchButton(
                text: widget.text[1],
                isSelected: selectedIndex == 1,
                onTap: () => onTabSelected(1),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
            child: VerticalDivider(
              color: ColorStyles.neutralLightDarkest,
              width: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _SwitchButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const _SwitchButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 167.5,
        height: 31,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyles.heading5.copyWith(
              color: isSelected
                  ? ColorStyles.neutralDarkDark
                  : ColorStyles.neutralDarkLight,
            ),
          ),
        ),
      ),
    );
  }
}
