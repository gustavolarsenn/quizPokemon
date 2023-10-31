import 'dart:math';

class quizBrain {
  int _step = 0;
  int listSize = 150;
  List<int> pokemonAlreadyChosen = [];

  int targetPokemon() {
    return Random().nextInt(4);
  }

  List<int> getPokemonChoices(int targetIndex) {
    List<int> numbers = List.generate(listSize, (index) => index);
    numbers.shuffle();
    List<int> fourNumbersList = numbers.sublist(0, 4);
    while (pokemonAlreadyChosen.contains(fourNumbersList[targetIndex])) {
      numbers.shuffle();
      fourNumbersList = numbers.sublist(0, 4);
    }
    pokemonAlreadyChosen.add(fourNumbersList[targetIndex]);
    return fourNumbersList;
  }
}
