import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class BrandMark extends StatelessWidget {
  const BrandMark({super.key, this.light = false, this.compact = false});

  final bool light;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final markSize = compact ? 38.0 : 46.0;
    final textColor = light ? Colors.white : AppColors.ink;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: markSize,
          height: markSize,
          decoration: BoxDecoration(
            color: light
                ? Colors.white.withValues(alpha: 0.12)
                : AppColors.primary,
            borderRadius: BorderRadius.circular(compact ? 12 : 15),
          ),
          alignment: Alignment.center,
          child: Text(
            '#',
            style: TextStyle(
              color: Colors.white,
              fontSize: compact ? 25 : 30,
              fontWeight: FontWeight.w800,
              height: 1,
            ),
          ),
        ),
        const SizedBox(width: 11),
        Text(
          'hash',
          style: TextStyle(
            color: textColor,
            fontSize: compact ? 22 : 27,
            fontWeight: FontWeight.w700,
            letterSpacing: -1,
          ),
        ),
      ],
    );
  }
}
