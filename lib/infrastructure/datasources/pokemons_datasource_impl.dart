import 'package:dio/dio.dart';
import 'package:miscelanios/domain/domain.dart';
import 'package:miscelanios/infrastructure/mappers/pokemon_mapper.dart';

class PokemonDatasourceImpl implements PokemonsDataSource {

  final Dio dio;

  PokemonDatasourceImpl() : dio = Dio(
    BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2'
    )
  );


  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {
  
    try {
      final response = await dio.get('/pokemon/$id');
      
      final pokemon = PokemonMapper.pokeApiPokemonToEntity(response.data);

      return ( pokemon, 'Data obtenida correctamente');
    } catch (e) {
      return (null, 'No se pudo obtener el pokemon $e');
    }
  }

}