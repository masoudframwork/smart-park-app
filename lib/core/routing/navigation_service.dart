import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationService {
  NavigationService._();

  // Store reference to router for context-free navigation
  static GoRouter? _router;

  static void initialize(GoRouter router) {
    _router = router;
  }

  // ==================== Core Navigation ====================

  /// Navigate to a route and add it to the navigation stack
  static void push(String path, {Object? extra, BuildContext? context}) {
    if (context != null) {
      context.push(path, extra: extra);
    } else {
      _router?.push(path, extra: extra);
    }
  }

  /// Navigate to a route and replace the entire navigation stack
  static void go(String path, {Object? extra, BuildContext? context}) {
    if (context != null) {
      context.go(path, extra: extra);
    } else {
      _router?.go(path, extra: extra);
    }
  }

  /// Replace the current route with a new one
  static void replace(String path, {Object? extra, BuildContext? context}) {
    if (context != null) {
      context.replace(path, extra: extra);
    } else {
      _router?.replace(path, extra: extra);
    }
  }

  /// Navigate back to the previous route
  static void pop<T>([T? result, BuildContext? context]) {
    if (context != null) {
      context.pop(result);
    } else {
      _router?.pop(result);
    }
  }

  /// Check if we can pop (go back)
  static bool canPop(BuildContext? context) {
    if (context != null) {
      return context.canPop();
    }
    return _router?.canPop() ?? false;
  }

  // ==================== Named Routes Navigation ====================

  static void pushNamed(
    String name, {
    Map<String, String> pathParameters = const {},
    Map<String, dynamic> queryParameters = const {},
    Object? extra,
    BuildContext? context,
  }) {
    if (context != null) {
      context.pushNamed(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra,
      );
    } else {
      _router?.pushNamed(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra,
      );
    }
  }

  static void goNamed(
    String name, {
    Map<String, String> pathParameters = const {},
    Map<String, dynamic> queryParameters = const {},
    Object? extra,
    BuildContext? context,
  }) {
    if (context != null) {
      context.goNamed(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra,
      );
    } else {
      _router?.goNamed(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra,
      );
    }
  }

  // Add similar changes for other methods...
}
