import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelanios/presentation/providers/providers.dart';

class LocationScreen extends ConsumerWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final userLocationAsync = ref.watch(userLocationProvider);
    final watchLocationAsync = ref.watch(watchLocationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubicación'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //! Current location
            Text('Ubicación actual'),
            userLocationAsync.when(
              data: (data) => Text('$data'), 
              error: (error, stackTrace) => Text('$error'), 
              loading: () => const CircularProgressIndicator(),
            ),
            SizedBox(height: 30,),
            //! Current location
            Text('Seguimiento de ubicación'),
            watchLocationAsync.when(
              data: (data) => Text('$data'), 
              error: (error, stackTrace) => Text('$error'), 
              loading: () => const CircularProgressIndicator(),
            ),


            
          ],
        ),
      ),
    );
  }
}