import 'package:flutter/material.dart';
import 'package:quiz_pokemon/models/pokemon.dart';
import 'package:quiz_pokemon/api/pokeapi.dart';
import 'package:quiz_pokemon/services/quiz_brain.dart';
import 'package:quiz_pokemon/utils/string_extension.dart';

// class PokemonQuiz extends StatefulWidget {
//   const PokemonQuiz({required this.pokemonList, super.key});
//   final List<Pokemon> pokemonList;

//   @override
//   State<PokemonQuiz> createState() => _PokemonQuizPageState();
//   // @override
//   // Widget build(BuildContext context) {
//   //   return MaterialApp(
//   //     home: Scaffold(
//   //       backgroundColor: Colors.grey.shade900,
//   //       body: const SafeArea(
//   //         child: Padding(
//   //           padding: EdgeInsets.symmetric(horizontal: 10.0),
//   //           child: PokemonQuizPage(),
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
// }

// // class PokemonQuizPage extends StatefulWidget {
// //   const PokemonQuizPage({super.key});

// // }

// class _PokemonQuizPageState extends State<PokemonQuiz> {
//   @override
//   Widget build(BuildContext context) {
//     var pokemonList = widget.pokemonList;
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Expanded(
//           flex: 5,
//           child: Padding(
//             padding: EdgeInsets.all(10.0),
//             child: Center(
//               child: Text(
//                 pokemonList[0].name, //'Texto do estado',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 25.0,
//                   color: const Color.fromARGB(255, 0, 0, 0),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         //       Expanded(
//         //         child: Padding(
//         //           padding: const EdgeInsets.all(10.0),
//         //           child: TextButton(
//         //             style: TextButton.styleFrom(
//         //               backgroundColor: Colors.blue,
//         //             ),
//         //             onPressed: () {
//         //               setState(() {
//         //                 stateMachine.checkChoice(true);
//         //               });
//         //             },
//         //             child: Text(
//         //               'A', //'Texto do Botão 1',
//         //               style: TextStyle(
//         //                 color: Colors.white,
//         //                 fontSize: 20.0,
//         //               ),
//         //             ),
//         //           ),
//         //         ),
//         //       ),
//         //       Expanded(
//         //         child: Padding(
//         //           padding: const EdgeInsets.all(10.0),
//         //           child: Visibility(
//         //             visible: stateMachine.getChoice2() != null,
//         //             child: TextButton(
//         //               style: TextButton.styleFrom(
//         //                 backgroundColor: Colors.red,
//         //               ),
//         //               onPressed: () {
//         //                 setState(() {
//         //                   stateMachine.checkChoice(false);
//         //                 });
//         //               },
//         //               child: Text(
//         //                 stateMachine.getChoice2() ?? "", //'Texto do Botão 2',
//         //                 style: TextStyle(
//         //                   color: Colors.white,
//         //                   fontSize: 20.0,
//         //                 ),
//         //               ),
//         //             ),
//         //           ),
//         //         ),
//         //       ),
//       ],
//     );
//   }
// }

class PokemonQuiz extends StatefulWidget {
  const PokemonQuiz({required this.pokemonList, super.key});
  final List<Pokemon> pokemonList;

  @override
  State<PokemonQuiz> createState() => _PokemonQuizPageState();
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //       backgroundColor: Colors.grey.shade900,
  //       appBar: AppBar(
  //         title: const Text('Pokemon Quiz'),
  //       ),
  //       body: SafeArea(
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //           child: PokemonQuizPage(),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

// class PokemonQuizPage extends StatefulWidget {
//   const PokemonQuizPage({Key? key}) : super(key: key);

//   @override
//   State<PokemonQuizPage> createState() => _PokemonQuizPageState();
// }

class _PokemonQuizPageState extends State<PokemonQuiz> {
  @override
  Widget build(BuildContext context) {
    var quiz_brain = quizBrain();
    var targetIndex = quiz_brain.targetPokemon();
    var pokemonChoices = quiz_brain.getPokemonChoices(targetIndex);
    var targetPokemon = pokemonChoices[targetIndex];
    var pokemonList = widget.pokemonList;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: EdgeInsets.all(70.0),
                child: Text('Acertos: 0', style: TextStyle(fontSize: 25))),
            Padding(
                padding: EdgeInsets.all(70.0),
                child: Text('Erros: 0', style: TextStyle(fontSize: 25))),
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
            onPressed: () {},
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
              // Lógica para verificar a resposta
              print('Resposta 2 selecionada');
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
              // Lógica para verificar a resposta
              print('Resposta 3 selecionada');
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
            onPressed: () {},
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
  }
}
