import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_color.dart';

class AppDivider extends StatelessWidget {
  final double? thickness;

  final double? height;

  final Color? color;
  final double? indent;
  final double? endIndent;
  final double? listHPadding;
  final double? iconWidth;
  final double? gap;

  const AppDivider({
    super.key,
    this.thickness,
    this.height,
    this.color,
    this.indent,
    this.endIndent,
    this.listHPadding,
    this.iconWidth,
    this.gap,
  });

  @override
  Widget build(BuildContext context) {
    final double _listHPadding = (listHPadding ?? 15.w);
    final double _iconWidth = (iconWidth ?? 15.w);
    final double _gap = (gap ?? 40.w);

    final double _computedIndent = _listHPadding + _iconWidth + _gap;
    final double _indent = indent ?? _computedIndent;
    final double _endIndent = endIndent ?? _listHPadding;

    return Divider(
      height: height ?? 0.0,
      thickness: thickness ?? 1.0,
      color: color ?? AppColor.greyDividerColor,
      indent: _indent,
      endIndent: _endIndent,
    );
  }
}
