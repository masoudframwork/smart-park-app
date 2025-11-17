import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/constants/image_string.dart';

final zoneImagesProvider = Provider<List<String>>((ref) {
  return [
    AppImages.car1,
    AppImages.car1,
    AppImages.car1,
  ];
});

final zonePageControllerProvider = Provider.autoDispose<PageController>((ref) {
  final controller = PageController();
  ref.onDispose(controller.dispose);
  return controller;
});
