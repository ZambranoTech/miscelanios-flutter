import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:miscelanios/presentation/providers/providers.dart';

class ControlledMapScreen extends ConsumerWidget {
  const ControlledMapScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final userInitialLocation = ref.watch(userLocationProvider);

    return Scaffold(
      body: userInitialLocation.when(
        data: (data) => MapAndControls(latitude: data.$1, longitude: data.$2),
        error: (error, stackTrace) => Text('$error'), 
        loading: () => const CircularProgressIndicator()
      ),

    );
  }
}

class MapAndControls extends ConsumerWidget {

  final double latitude;
  final double longitude;

  const MapAndControls({super.key, required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context, ref) {

    final mapControllerState = ref.watch(mapControllerProvider);

    return Stack(
      children: [
        _MapView(initialLat: latitude, initialLng: longitude,),

        //! Boton para salir
        Positioned(
          top: 40,
          left: 20,
          child: IconButton.filledTonal(onPressed: () {
            context.pop();
          }, icon: const Icon(Icons.arrow_back))
        ),

        //! Ir a la posición del usuario
         Positioned(
          bottom: 40,
          left: 20,
          child: IconButton.filledTonal(onPressed: () {

            ref.read(mapControllerProvider.notifier)
              .findUser();

          }, icon: const Icon(Icons.location_searching))
        ),

         //! Seguir la posición del usuario
         Positioned(
          bottom: 90,
          left: 20,
          child: IconButton.filledTonal(onPressed: () {
            ref.read(mapControllerProvider.notifier)
              .toggleFollowUser();
          }, icon: Icon(mapControllerState.followUser? Icons.directions_run : Icons.accessibility )) // Icons.accessibility_new_outlined
        ),

        //! Crear marcador
         Positioned(
          bottom: 140,
          left: 20,
          child: IconButton.filledTonal(onPressed: () {
            ref.read(mapControllerProvider.notifier).addMarkerCurrentPosition();
          }, icon: const Icon(Icons.pin_drop )) // Icons.accessibility_new_outlined
        ),


      ],
    );
  }
}

class _MapView extends ConsumerStatefulWidget {
  final double initialLat;
  final double initialLng;

  const _MapView({required this.initialLat, required this.initialLng});

  @override
  __MapViewState createState() => __MapViewState();
}

class __MapViewState extends ConsumerState<_MapView> {
  @override
  Widget build(BuildContext context) {

    final mapController = ref.watch(mapControllerProvider);

    return GoogleMap(
        markers: mapController.marketsSet,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.initialLat, widget.initialLng),
          zoom: 12,
        ),
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        onLongPress: (position) => ref.read(mapControllerProvider.notifier).addMarker(position.latitude, position.longitude, position.toString()),
        onMapCreated: (GoogleMapController controller) {
          // _controller.complete(controller);
          ref.read(mapControllerProvider.notifier)
            .setMapController(controller);
        },
      );
  }
}