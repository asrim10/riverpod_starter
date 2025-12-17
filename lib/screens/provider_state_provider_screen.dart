import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

//1. Providr Ref : Provider -> Provider
//2. Widget Ref: Provider -> Widget

//Create a provider -- immutable
final appbarProvider = Provider<String>((ref) {
  return "Provider and State Provider";
});

final providerDefProvider = Provider<String>((ref) {
  return "The Provider package in Flutter is a widely adopted state management solution that acts as a simple wrapper around the core InheritedWidget class to make managing and sharing application state across the widget tree easier and more reusable. ";
});

final stateProviderDefProvider = Provider<String>((ref) {
  return "StateProvider in Flutter primarily refers to a feature within the Riverpod state management package, which is used for managing simple, mutable pieces of state like a boolean, string, or number.";
});

//counter ko lagi
//Mutable counter

final counterProvider = StateProvider<int>((ref) {
  return 0;
});

class ProviderStateProviderScreen extends ConsumerWidget {
  const ProviderStateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurple.shade800,
              Colors.deepPurple.shade400,
              Colors.purple.shade300,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    //Consumer
                    Text(
                      ref.read(appbarProvider),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          ref.read(providerDefProvider),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        ref.read(stateProviderDefProvider),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 12),
                      const Text(
                        'Counter',
                        style: TextStyle(color: Colors.white70, fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${ref.watch(counterProvider)}',
                        style: Theme.of(
                          context,
                        ).textTheme.displayLarge?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () {
              ref.watch(counterProvider.notifier).state--;
            },
            backgroundColor: Colors.red,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            heroTag: 'reset',
            onPressed: () {
              ref.read(counterProvider.notifier).state = 0;
            },
            backgroundColor: Colors.grey,
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () {
              ref.watch(counterProvider.notifier).state++;
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
