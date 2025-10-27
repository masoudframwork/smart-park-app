import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle appTextTheme;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? padding;

  const AppText({
    super.key,
    required this.text,
    required this.appTextTheme,
    this.textAlign = TextAlign.center,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(text, style: appTextTheme, textAlign: textAlign);
    return padding != null
        ? Padding(padding: padding!, child: textWidget)
        : textWidget;
  }
}
