import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelanios/domain/domain.dart';
import 'package:miscelanios/infrastructure/infrastructure.dart';

final pokemonsRepositoryProvider = Provider<PokemonsRepository>((ref) {
  return PokemonsRepositoryImpl();
});


final pokemonProvider = FutureProvider.family<Pokemon, String>((ref, id) async {
  
  final pokemonsRepository = ref.watch(pokemonsRepositoryProvider);

  final ( pokemon, error ) = await pokemonsRepository.getPokemon(id);
  
  if ( pokemon != null ) return pokemon;

  throw error;
});