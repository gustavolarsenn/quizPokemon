import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_pokemon/screens/home.dart';
import 'package:quiz_pokemon/services/quiz_brain.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => quizBrain(),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const HomeScreen(),
      },
      initialRoute: '/',
    );
  }
}
