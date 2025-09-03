import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_cubit.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => CounterCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter with Cubit',
      theme: ThemeData(useMaterial3: true),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Read cubit methods with context.read<CounterCubit>()
    // Listen to state changes with BlocBuilder<CounterCubit, int>
    return Scaffold(
      appBar: AppBar(title: const Text('Counter (Cubit)')),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, count) {
            return Text(
              '$count',
              style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              heroTag: 'decrement',
              onPressed: () => context.read<CounterCubit>().decrement(),
              label: const Text('-'),
            ),
            const SizedBox(width: 12),
            FloatingActionButton.extended(
              heroTag: 'reset',
              onPressed: () => context.read<CounterCubit>().reset(),
              label: const Text('Reset'),
            ),
            const SizedBox(width: 12),
            FloatingActionButton.extended(
              heroTag: 'increment',
              onPressed: () => context.read<CounterCubit>().increment(),
              label: const Text('+'),
            ),
          ],
        ),
      ),
    );
  }
}
