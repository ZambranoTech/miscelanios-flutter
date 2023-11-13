
import 'package:miscelanios/domain/domain.dart';
import 'package:miscelanios/infrastructure/datasources/pokemons_datasource_impl.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {

  final PokemonsDataSource datasource;

  PokemonsRepositoryImpl({PokemonsDataSource? datasource})
    : datasource = datasource ?? PokemonDatasourceImpl();

  @override
  Future<(Pokemon?, String)> getPokemon(String id) {
    return datasource.getPokemon(id);
  }

}