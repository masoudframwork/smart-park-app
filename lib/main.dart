import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smart/core/dependency_injection/service_locator.dart';
import 'package:smart/core/helpers/platform_manager.dart';
import 'package:smart/core/models/my_logger.dart';
import 'package:smart/core/routing/app_route.dart';
import 'package:smart/generated/l10n.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      AppRouter.initialize();
      await PlatformManager.configureOrientationsAtLaunch();
      await initServiceLocator();
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
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        final designSize = PlatformManager.designSizeForSizingInfo(sizingInfo);
        return ScreenUtilInit(
          designSize: designSize,
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
                  data: media.copyWith(
                    textScaler: const TextScaler.linear(1.0),
                  ),
                  child: child!,
                );
              },
              routerConfig: AppRouter.router,
            );
          },
        );
      },
    );
  }
}
