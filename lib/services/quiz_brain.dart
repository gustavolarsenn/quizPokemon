import 'dart:math';
import 'package:flutter/material.dart';

class quizBrain extends ChangeNotifier {
  int listSize = 150;
  int _correctCount = 0;
  int _wrongCount = 0;
  List<int> pokemonAlreadyChosen = [];
  int targetPokemon() {
    return Random().nextInt(4);
  }

  ValueNotifier<int> totalScore = ValueNotifier<int>(0);

  String answerMessage = "";

  int get correctCount => _correctCount;
  int get wrongCount => _wrongCount;

  void checkChoice(String pokemonName, String correctPokemonName) {
    if (pokemonName == correctPokemonName) {
      _correctCount++;
      answerMessage = "Resposta correta!";
    } else {
      _wrongCount++;
      answerMessage = "Resposta errada!";
    }
    totalScore.value++;
    notifyListeners();
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

  void resetQuiz() {
    _correctCount = 0;
    _wrongCount = 0;
    pokemonAlreadyChosen = [];
    answerMessage = "";
    totalScore.value = 0;
  }
}
