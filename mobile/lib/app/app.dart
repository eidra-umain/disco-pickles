import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Libresse Cycle',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB85C38)),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text('Libresse Cycle Tracker'),
        ),
      ),
    );
  }
}
