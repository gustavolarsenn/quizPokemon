import 'package:quiz_pokemon/models/pokemon_data.dart';
import 'package:quiz_pokemon/utils/constants.dart';

class Pokemon {
  String name;
  String url;
  PokemonData? pokemonData;

  Pokemon({required this.name, required this.url});

  // quebra a url em lista, inverte, pula o 1º el e retorna o segundo
  // converte para inteiro
  get id {
    var urlParts = url.split('/');
    var id = urlParts.reversed.skip(1).first;
    return int.parse(id);
  }

  get image => '$pokemonImgUrl/$id.png';

  factory Pokemon.fromJson(Map<String, dynamic> jsonData) {
    return Pokemon(name: jsonData['name'], url: jsonData['url']);
  }
}
