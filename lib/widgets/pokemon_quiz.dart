import 'package:flutter/material.dart';
import 'package:quiz_pokemon/models/pokemon.dart';
import 'package:quiz_pokemon/services/quiz_brain.dart';
import 'package:quiz_pokemon/utils/string_extension.dart';
import 'package:provider/provider.dart';

class PokemonQuiz extends StatefulWidget {
  const PokemonQuiz({required this.pokemonList, super.key});
  final List<Pokemon> pokemonList;

  @override
  State<PokemonQuiz> createState() => _PokemonQuizPageState();
}

class _PokemonQuizPageState extends State<PokemonQuiz> {
  @override
  Widget build(BuildContext context) {
    var quiz_brain = Provider.of<quizBrain>(context);
    var targetIndex = quiz_brain.targetPokemon();
    var pokemonChoices = quiz_brain.getPokemonChoices(targetIndex);
    var pokemonList = widget.pokemonList;
    if (quiz_brain.totalScore.value < 10) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${quiz_brain.answerMessage}',
                  style: TextStyle(
                      fontSize: 20,
                      color: quiz_brain.answerMessage == 'Resposta correta!'
                          ? Colors.green
                          : Colors.red,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(70.0, 10.0, 70.0, 10.0),
                  child: Text('Acertos: ${quiz_brain.correctCount}',
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal))),
              Padding(
                  padding: EdgeInsets.fromLTRB(70.0, 10.0, 70.0, 10.0),
                  child: Text('Erros: ${quiz_brain.wrongCount}',
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal))),
            ],
          ),
          Expanded(
            flex: 5,
            child: Image.network(
              pokemonList[pokemonChoices[targetIndex]].image,
              fit: BoxFit.scaleDown,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(75.0, 10.0, 75.0, 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: const EdgeInsets.all(20.0),
              ),
              onPressed: () {
                setState(() {
                  quiz_brain.checkChoice(
                      pokemonList[pokemonChoices[0]].name.capitalize(),
                      pokemonList[pokemonChoices[targetIndex]]
                          .name
                          .capitalize());
                });
              },
              child: Text(
                pokemonList[pokemonChoices[0]].name.capitalize(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(75.0, 10.0, 75.0, 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: const EdgeInsets.all(20.0),
              ),
              onPressed: () {
                setState(() {
                  quiz_brain.checkChoice(
                      pokemonList[pokemonChoices[1]].name.capitalize(),
                      pokemonList[pokemonChoices[targetIndex]]
                          .name
                          .capitalize());
                });
              },
              child: Text(
                pokemonList[pokemonChoices[1]].name.capitalize(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(75.0, 10.0, 75.0, 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: const EdgeInsets.all(20.0),
              ),
              onPressed: () {
                setState(() {
                  quiz_brain.checkChoice(
                      pokemonList[pokemonChoices[2]].name.capitalize(),
                      pokemonList[pokemonChoices[targetIndex]]
                          .name
                          .capitalize());
                });
              },
              child: Text(
                pokemonList[pokemonChoices[2]].name.capitalize(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(75.0, 10.0, 75.0, 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: const EdgeInsets.all(20.0),
              ),
              onPressed: () {
                setState(() {
                  quiz_brain.checkChoice(
                      pokemonList[pokemonChoices[3]].name.capitalize(),
                      pokemonList[pokemonChoices[targetIndex]]
                          .name
                          .capitalize());
                });
              },
              child: Text(
                pokemonList[pokemonChoices[3]].name.capitalize(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return AlertDialog(
        title: const Text('Fim de Jogo!'),
        content: Text('Você acertou ${quiz_brain.correctCount}/10 perguntas!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              setState(() {
                quiz_brain.resetQuiz();
              });
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => PokemonQuiz(pokemonList: pokemonList),
                ),
              );
            },
            child: const Text('Reiniciar'),
          ),
        ],
      );
    }
  }
}
