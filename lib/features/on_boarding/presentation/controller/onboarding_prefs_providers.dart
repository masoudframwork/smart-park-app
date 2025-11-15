import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart/core/constants/cache_keys.dart';
import 'package:smart/core/helpers/secure_stoage_helper.dart';

final secureStorageHelperProvider = Provider<SecureStorageHelper>((ref) {
  return SecureStorageHelper();
});

final hideTipsProvider = StateNotifierProvider<_HideTipsController, bool>(
      (ref) => _HideTipsController(ref),
);

class _HideTipsController extends StateNotifier<bool> {
  _HideTipsController(this.ref) : super(false) {
    _load();
  }
  final Ref ref;

  Future<void> _load() async {
    final s = ref.read(secureStorageHelperProvider);
    final key = CacheKeys().onboardingHidden;
    state = (await s.read(key)) == 'true';
  }

  Future<void> set(bool value) async {
    state = value;
    final s = ref.read(secureStorageHelperProvider);
    await s.write(CacheKeys().onboardingHidden, value.toString());
  }

  Future<void> toggle() => set(!state);
}

final isOnboardingHiddenProvider = FutureProvider<bool>((ref) async {
  final s = ref.read(secureStorageHelperProvider);
  final key = CacheKeys().onboardingHidden;
  return (await s.read(key)) == 'true';
});
