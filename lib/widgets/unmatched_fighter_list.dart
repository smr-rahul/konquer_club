import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konquer_club/models/fighter.dart';

import '../providers/konquer_provider.dart';

class UnmatchedFighterList extends ConsumerWidget {
  const UnmatchedFighterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fighters =  ref.watch(fightersProvider).map((e) => e).toList();
    final isFightersLoading = ref.watch(isLoadingFightersProvider);
    final bouts =  ref.watch(boutsProvider);
    final isBoutsLoading = ref.watch(isLoadingBoutsProvider);
    List<Fighter> unmatched = [];
    for(Fighter fighter in fighters){
      var bout = bouts.firstWhereOrNull((bout) => bout.redFighter!.id == fighter.id || bout.blueFighter!.id == fighter.id);
      if(bout == null){
        unmatched.add(fighter);
      }

    }
    return isFightersLoading && isBoutsLoading
        ? const Center(
      child: CircularProgressIndicator(),
    )
        : ListView.builder(
        itemCount: unmatched.length,
        itemBuilder: (_, index){
          return Card(
            child: ListTile(
              title: Text(unmatched[index].firstName!+' '+unmatched[index].lastName!),
              subtitle: Text(''),

            ),
          );
        }
    );
  }

  // @override
  // Widget build(BuildContext context, WidgetRef ref) {
  //   final _data =  ref.watch(fightersProvider);
  //   return _data.when(
  //       data: (_data){
  //         List<Fighter> fighters = _data.map((e) => e).toList().where((element) => element.usaBoxingId==null).toList();
  //
  //         return ListView.builder(
  //           itemCount: fighters.length,
  //             itemBuilder: (_, index){
  //               return Card(
  //                 child: ListTile(
  //                   title: Text(fighters[index].firstName!+' '+fighters[index].lastName!),
  //                   subtitle: Text(''),
  //                 ),
  //               );
  //             }
  //         );
  //       },
  //       error: (err, stack) => Text(err.toString()),
  //       loading: () => const Center(
  //         child: CircularProgressIndicator(),
  //       )
  //   );
  // }
}