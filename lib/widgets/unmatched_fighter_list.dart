import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/unmatched_fighters_provider.dart';

class UnmatchedFighterList extends ConsumerWidget {
  const UnmatchedFighterList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data =  ref.watch(unmatchedFightersProvider);
    return _data.when(
        data: (fighters){
          return ListView.builder(
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
        },
        error: (err, stack) => Text(err.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        )
    );
  }
}