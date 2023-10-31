import 'package:flutter/material.dart';
import 'package:quiz_pokemon/screens/home.dart';

void main() {
  runApp(const MainApp());
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

// import 'package:flutter/material.dart';

/* void main() {
  runApp(const PokemonQuizApp());
}

class PokemonQuizApp extends StatelessWidget {
  const PokemonQuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: const Text('Pokemon Quiz'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: PokemonQuizPage(),
          ),
        ),
      ),
    );
  }
}

class PokemonQuizPage extends StatefulWidget {
  const PokemonQuizPage({Key? key}) : super(key: key);

  @override
  State<PokemonQuizPage> createState() => _PokemonQuizPageState();
}

class _PokemonQuizPageState extends State<PokemonQuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: const EdgeInsets.all(12.0),
              ),
              onPressed: () {},
              child: Text(
                'Bulbasaur',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: const EdgeInsets.all(12.0),
              ),
              onPressed: () {
                // Lógica para verificar a resposta
                print('Resposta 2 selecionada');
              },
              child: Text(
                'Charmander',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: const EdgeInsets.all(12.0),
              ),
              onPressed: () {
                // Lógica para verificar a resposta
                print('Resposta 3 selecionada');
              },
              child: Text(
                'Squirtle',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: const EdgeInsets.all(12.0),
              ),
              onPressed: () {},
              child: Text(
                'Pikachu',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
 */