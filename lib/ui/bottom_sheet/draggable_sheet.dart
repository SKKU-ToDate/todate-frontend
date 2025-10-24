import 'package:flutter/material.dart';

import '../../global/style/color_styles.dart';

class DraggableSheet extends StatelessWidget {
  final Widget child;

  final List<double> snapSizes;
  final double initialChildSize;

  const DraggableSheet({
    super.key,
    required this.child,
    this.initialChildSize = 0.2,
    this.snapSizes = const [0.2, 0.5],
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      snap: true,
      snapSizes: snapSizes,
      initialChildSize: initialChildSize,
      minChildSize: snapSizes.first,
      maxChildSize: snapSizes.last,

      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                  width: 49,
                  height: 5,
                  decoration: BoxDecoration(
                    color: ColorStyles.neutralLightDark,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  physics: const ClampingScrollPhysics(),
                  child: child,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
