import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Color? backgroundColor;
  final bool useSafeArea;
  final bool safeAreaBottom;

  const BaseScreen({
    super.key,
    required this.body,
    this.appBar,
    this.backgroundColor,
    this.useSafeArea = true,
    this.safeAreaBottom = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // important for bottom navigation bar
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: appBar,
      body: useSafeArea
          ? SafeArea(
        bottom: safeAreaBottom,
        child: body,
      )
          : body,
    );
  }
}
