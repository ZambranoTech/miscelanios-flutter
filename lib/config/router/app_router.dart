

import 'package:go_router/go_router.dart';
import 'package:miscelanios/presentation/screens/screens.dart';

final appRouter = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/permissions',
      builder: (context, state) => const PermissionsScreen(),
    ),

    GoRoute(
      path: '/gyroscope',
      builder: (context, state) => const GyroscopeScreen(),
    ),
    GoRoute(
      path: '/accelerometer',
      builder: (context, state) => const AccelerometerScreen(),
    ),
    GoRoute(
      path: '/magnetometer',
      builder: (context, state) => const MagnetometerScreen(),
    ),
    GoRoute(
      path: '/gyroscope-ball',
      builder: (context, state) => const GyroscopeBallScreen(),
    ),
    GoRoute(
      path: '/compass',
      builder: (context, state) => const CompassScreen(),
    ),

    // POKEMONS
    GoRoute(
      path: '/pokemons',
      builder: (context, state) => const PokemonsScreen(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '1';
            return PokemonScreen(pokemonId: id,);
          },
          )
      ]
    ),


    // Biométricos
    GoRoute(
      path: '/biometrics',
      builder: (context, state) => const BiometricScreen(),
    ),
    
  ]
  
  
  );