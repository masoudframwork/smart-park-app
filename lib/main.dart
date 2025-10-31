import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart/core/dependency_injection/service_locator.dart';
import 'package:smart/core/models/my_logger.dart';
import 'package:smart/core/routing/app_route.dart';
import 'package:smart/generated/l10n.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await initServiceLocator();
      AppRouter.initialize();

      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.presentError(details);
      };

      runApp(ProviderScope(observers: [MyLogger()], child: const MyApp()));
    },
    (error, stack) {
      log('Uncaught async error: $error');
    },
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: ((MediaQuery.of(context).size.width > 800))
          ? (MediaQuery.of(context).orientation == Orientation.portrait
              ? const Size(834, 1194)
              : const Size(1194, 834))
          : const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'IBM Plex Sans Arabic',
            useMaterial3: true,
          ),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: const Locale('ar'),
          builder: (context, child) {
            final media = MediaQuery.of(context);
            return MediaQuery(
              data: media.copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
