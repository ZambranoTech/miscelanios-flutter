import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelanios/presentation/providers/providers.dart';

class AdRewardedScreen extends ConsumerWidget {
  const AdRewardedScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final adPoints = ref.watch(adPointsProvider);

    final adRewardedAsync = ref.watch(adRewardedProvider);

    ref.listen(adRewardedProvider, (previous, next) {
      if (!next.hasValue) return;
      if (next.value == null) return;
      next.value!.show(onUserEarnedReward: (ad, reward) {
        ref.read(adPointsProvider.notifier).update((state) => state + reward.amount.toInt());
      });
     });

    if (adRewardedAsync.isLoading) {
      return const Scaffold(
        body: Center(
          child: Text('Cargando anuncios'),
          ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad Rewarded'),
      ),
      body: Center(
        child: Text('Puntos actuales: $adPoints'),
      ),
    );
  }
}