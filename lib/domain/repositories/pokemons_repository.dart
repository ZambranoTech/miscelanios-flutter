import 'package:miscelanios/domain/domain.dart';

abstract class PokemonsRepository {

  Future<(Pokemon?, String)> getPokemon (  String id );
 

}