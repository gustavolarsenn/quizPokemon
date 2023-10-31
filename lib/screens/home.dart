import 'package:flutter/material.dart';
import 'package:quiz_pokemon/api/pokeapi.dart';
import 'package:quiz_pokemon/widgets/pokemon_quiz.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: PokeAPI.getPokemonList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return PokemonQuiz(pokemonList: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
        },
      ),
    );
  }
}
