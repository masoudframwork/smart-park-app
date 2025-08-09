import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/splahe_controller.dart';
import '../state/splash_state.dart';

final splashProvider = StateNotifierProvider<SplashController, SplashState>(
  (ref) => SplashController(),
);





