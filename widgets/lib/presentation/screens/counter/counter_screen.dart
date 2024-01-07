import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets/presentation/providers/counter_provider.dart';
class CounterScreen extends ConsumerWidget {
  
  const CounterScreen({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref){
    final int counterValue = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Text(
          'Valor $counterValue',
          style: Theme.of(context).textTheme.titleLarge,
          
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          
          
        },
      ),
    );
  }
}