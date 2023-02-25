import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konquer_club/models/fighter.dart';

import '../providers/konquer_provider.dart';

class AllFighterList extends ConsumerWidget {
  const AllFighterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fighters =  ref.watch(fightersProvider);
    final isLoading = ref.watch(isLoadingFightersProvider);
    return isLoading
        ? const Center(
      child: CircularProgressIndicator(),
    )
        : ListView.builder(
        itemCount: fighters.length,
        itemBuilder: (_, index){
          return Card(
            child: ListTile(
              title: Text(fighters[index].firstName!+' '+fighters[index].lastName!),
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
  //         List<Fighter> fighters = _data.map((e) => e).toList();
  //
  //         return ListView.builder(
  //             itemCount: fighters.length,
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