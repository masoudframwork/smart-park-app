import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/features/home/presentation/home_page.dart';

void main() {
  group('HomePage Tests', () {
    testWidgets('HomePage should render without crashing',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        ProviderScope(
          child: ScreenUtilInit(
            designSize: const Size(393, 852),
            builder: (context, child) => MaterialApp(
              home: const HomePage(),
            ),
          ),
        ),
      );

      // Wait for initial frame only
      await tester.pump();

      // Verify that the HomePage renders
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('HomePage should show loading indicator initially',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: ScreenUtilInit(
            designSize: const Size(393, 852),
            builder: (context, child) => MaterialApp(
              home: const HomePage(),
            ),
          ),
        ),
      );

      // Wait for initial frame
      await tester.pump();

      // Should show loading indicator initially
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
