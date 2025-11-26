import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Color? backgroundColor;

  const BaseScreen({
    super.key,
    required this.body,
    this.appBar,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: appBar,
      body: SafeArea(
        top: false,   // IMPORTANT
        bottom: false,
        child: body,
      ),
    );
  }
}

