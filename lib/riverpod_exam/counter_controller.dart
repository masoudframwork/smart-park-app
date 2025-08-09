import 'package:aml_client/riverpod_exam/counter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterController {
  final WidgetRef ref;
  CounterController(this.ref);

  void increment() {
    ref.read(counterProvider.notifier).state++;
  }

  void decrement() {
    ref.read(counterProvider.notifier).state--;
  }

  int get count => ref.watch(counterProvider);
}
