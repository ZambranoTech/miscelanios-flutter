
import 'package:miscelanios/domain/domain.dart';

abstract class PokemonsDataSource {

  Future<(Pokemon?, String)> getPokemon (  String id );
 

}