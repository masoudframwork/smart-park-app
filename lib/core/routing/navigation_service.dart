import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationService {
  NavigationService._();

  /// Navigate to a route and add it to the navigation stack
  /// Allows back navigation
  static void push(BuildContext context, String path, {Object? extra}) {
    context.push(path, extra: extra);
  }

  /// Navigate to a route and replace the entire navigation stack
  /// Prevents back navigation to previous routes
  static void go(BuildContext context, String path, {Object? extra}) {
    context.go(path, extra: extra);
  }

  /// Replace the current route with a new one
  /// Back button will skip the replaced route
  static void replace(BuildContext context, String path, {Object? extra}) {
    context.replace(path, extra: extra);
  }

  /// Navigate back to the previous route
  static void pop<T>(BuildContext context, [T? result]) {
    context.pop(result);
  }

  /// Check if we can pop (go back)
  static bool canPop(BuildContext context) {
    return context.canPop();
  }

  // ==================== Named Routes Navigation ====================

  /// Push to a named route with parameters
  static void pushNamed(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const {},
    Map<String, dynamic> queryParameters = const {},
    Object? extra,
  }) {
    context.pushNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  /// Go to a named route (replace stack)
  static void goNamed(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const {},
    Map<String, dynamic> queryParameters = const {},
    Object? extra,
  }) {
    context.goNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  /// Replace current route with a named route
  static void replaceNamed(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const {},
    Map<String, dynamic> queryParameters = const {},
    Object? extra,
  }) {
    context.replaceNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  // ==================== Advanced Navigation ====================

  /// Push a route and remove all routes until a predicate is true
  /// Example: pushAndRemoveUntil(context, '/home', (route) => route == '/')
  static void pushAndRemoveUntil(
    BuildContext context,
    String path,
    bool Function(String) predicate, {
    Object? extra,
  }) {
    // Pop until predicate is true
    while (context.canPop()) {
      final currentRoute = GoRouterState.of(context).uri.path;
      if (predicate(currentRoute)) break;
      context.pop();
    }
    // Then push the new route
    context.push(path, extra: extra);
  }

  /// Go to a route and remove all routes until a predicate is true
  static void goAndRemoveUntil(
    BuildContext context,
    String path,
    bool Function(String) predicate, {
    Object? extra,
  }) {
    while (context.canPop()) {
      final currentRoute = GoRouterState.of(context).uri.path;
      if (predicate(currentRoute)) break;
      context.pop();
    }
    context.go(path, extra: extra);
  }

  /// Push replacement - replaces current route
  static void pushReplacement(
    BuildContext context,
    String path, {
    Object? extra,
  }) {
    context.replace(path, extra: extra);
  }

  /// Remove current route and push new one
  static void popAndPush(BuildContext context, String path, {Object? extra}) {
    context.pop();
    context.push(path, extra: extra);
  }

  /// Pop until a specific route path
  static void popUntil(BuildContext context, String targetPath) {
    while (context.canPop()) {
      final currentPath = GoRouterState.of(context).uri.path;
      if (currentPath == targetPath) break;
      context.pop();
    }
  }

  /// Pop until the root route
  static void popUntilRoot(BuildContext context) {
    while (context.canPop()) {
      context.pop();
    }
  }

  /// Pop until predicate returns true
  static void popWhile(BuildContext context, bool Function(String) predicate) {
    while (context.canPop()) {
      final currentPath = GoRouterState.of(context).uri.path;
      if (!predicate(currentPath)) break;
      context.pop();
    }
  }

  // ==================== Navigation with Results ====================

  /// Push a route and wait for result
  static Future<T?> pushForResult<T>(
    BuildContext context,
    String path, {
    Object? extra,
  }) async {
    return await context.push<T>(path, extra: extra);
  }

  /// Push named route and wait for result
  static Future<T?> pushNamedForResult<T>(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const {},
    Map<String, dynamic> queryParameters = const {},
    Object? extra,
  }) async {
    return await context.pushNamed<T>(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  // ==================== Route Information ====================

  /// Get current route path
  static String getCurrentPath(BuildContext context) {
    return GoRouterState.of(context).uri.path;
  }

  /// Get current route location (full URI)
  static String getCurrentLocation(BuildContext context) {
    return GoRouterState.of(context).uri.toString();
  }

  /// Get current route name
  static String? getCurrentName(BuildContext context) {
    return GoRouterState.of(context).name;
  }

  /// Get path parameters
  static Map<String, String> getPathParameters(BuildContext context) {
    return GoRouterState.of(context).pathParameters;
  }

  /// Get query parameters
  static Uri getQueryParameters(BuildContext context) {
    return GoRouterState.of(context).uri;
  }

  /// Get extra data passed to route
  static Object? getExtra(BuildContext context) {
    return GoRouterState.of(context).extra;
  }

  // ==================== Utility Methods ====================

  /// Check if a specific route is in the navigation stack
  static bool isRouteActive(BuildContext context, String path) {
    return GoRouterState.of(context).uri.path == path;
  }

  /// Refresh current route
  static void refresh(BuildContext context) {
    final currentPath = getCurrentPath(context);
    context.go(currentPath);
  }
}
