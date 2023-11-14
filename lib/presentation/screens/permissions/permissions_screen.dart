import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelanios/presentation/providers/providers.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permisos'),
      ),
      body: const _PermissionsView(),
    );
  }
}

class _PermissionsView  extends ConsumerWidget {
  const _PermissionsView ();

  @override
  Widget build(BuildContext context, ref) {

    final permissions = ref.watch(permissionsProvider);
    final showAds = ref.watch(showAdsProvider);

    return ListView(
      children: [
        CheckboxListTile(
          value: permissions.cameraGranted, 
          title: const Text('Cámara'),
          subtitle: Text('Estado actual: ${permissions.camera}'),
          onChanged: ( _ ) {
            ref.read(permissionsProvider.notifier).requestCameraAccess();
          }
        ),
        CheckboxListTile(
          value: permissions.photoLibraryGranted, 
          title: const Text('Galeria de fotos'),
          subtitle: Text('Estado actual: ${permissions.photoLibrary}'),
          onChanged: ( _ ) {
            ref.read(permissionsProvider.notifier).requestPhotoLibraryAccess();
          }
        ),
        CheckboxListTile(
          value: permissions.locationGranted, 
          title: const Text('Location'),
          subtitle: Text('Estado actual: ${permissions.location}'),
          onChanged: ( _ ) {
            ref.read(permissionsProvider.notifier).requestLocationAccess();
          }
        ),

        CheckboxListTile(
          value: permissions.sensorsGranted, 
          title: const Text('Sensors'),
          subtitle: Text('Estado actual: ${permissions.sensors}'),
          onChanged: ( _ ) {
            ref.read(permissionsProvider.notifier).requestSensorsAccess();
          }
        ),

        CheckboxListTile(
          value: showAds, 
          title: const Text('Mostrar Ads'),
          subtitle: const Text('Esta opción muestra u oculta las ads'),
          onChanged: ( _ ) {
            ref.read(showAdsProvider.notifier).toggleAds();
          }
        ),

      ],
    );
  }
}