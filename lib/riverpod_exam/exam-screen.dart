import 'package:aml_client/riverpod_exam/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExamScreen extends ConsumerWidget {
  const ExamScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = CounterController(ref);
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${counter.count}', style: const TextStyle(fontSize: 32)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 60,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey,
                ),
                child: IconButton(
                  onPressed: counter.increment,
                  icon: const Icon(Icons.add),
                ),
              ),
              Container(
                width: 60,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey,
                ),
                child: IconButton(
                  onPressed: counter.decrement,
                  icon: const Icon(Icons.remove),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
