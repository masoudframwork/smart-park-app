import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//animation app
CustomTransitionPage<T> softTransitionPage<T>({
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    transitionDuration: const Duration(milliseconds: 280),
    reverseTransitionDuration: const Duration(milliseconds: 220),
    child: child,
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) {
      final slide = Tween<Offset>(
        begin: const Offset(0.03, 0),
        end: Offset.zero,
      ).animate(animation);

      return FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: slide,
          child: child,
        ),
      );
    },
  );
}
