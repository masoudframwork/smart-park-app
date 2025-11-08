import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';

const double kTabletWidthThreshold = 800;

const Size kMobileDesignSize = Size(393, 852);
const Size kTabletPortraitDesignSize = Size(834, 1194);
const Size kTabletLandscapeDesignSize = Size(1194, 834);

class PlatformManager {
  PlatformManager._();

  static Future<void> configureOrientationsAtLaunch() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static Size designSizeForSizingInfo(SizingInformation info) {
    final width = info.screenSize.width;
    final bool isTablet = width > kTabletWidthThreshold;

    if (isTablet) {
      return kTabletPortraitDesignSize;
    }

    // otherwise موبايل
    return kMobileDesignSize;
  }

  static Size _currentLogicalSize() {
    final view = PlatformDispatcher.instance.views.first;
    final physical = view.physicalSize;
    final pixelRatio = view.devicePixelRatio == 0 ? 1 : view.devicePixelRatio;
    return Size(physical.width / pixelRatio, physical.height / pixelRatio);
  }
}
