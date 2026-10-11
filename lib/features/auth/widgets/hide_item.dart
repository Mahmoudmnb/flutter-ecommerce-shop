import 'package:flutter/material.dart';

import 'package:shop_app/core/constant.dart';

class HideItem extends StatelessWidget {
  final Widget child;
  final double maxHight;
  final bool visabl;
  const HideItem({
    super.key,
    required this.maxHight,
    required this.child,
    required this.visabl,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Constant.duration,
      height: visabl ? maxHight : 0,
      child: AnimatedOpacity(
        duration: Constant.duration,
        opacity: visabl ? 1 : 0,
        child: child,
      ),
    );
  }
}
