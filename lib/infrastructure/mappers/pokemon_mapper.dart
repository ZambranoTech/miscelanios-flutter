
import 'package:miscelanios/domain/domain.dart';
import 'package:miscelanios/infrastructure/models/pokeapi_pokemon_response.dart';

class PokemonMapper {

  static Pokemon pokeApiPokemonToEntity ( Map<String, dynamic> json ) {

    final pokeApiPokemon = PokeApiPokemonResponse.fromJson(json); 

    return Pokemon(
      id: pokeApiPokemon.id, 
      name: pokeApiPokemon.name, 
      spriteFront: pokeApiPokemon.sprites.frontDefault,
    );
  }


}