import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/bouts_provider.dart';

class MatchList extends ConsumerWidget {
  const MatchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bouts =  ref.watch(boutsProvider);
    return bouts.when(
        data: (bouts){
          return ListView.builder(
              itemCount: bouts.length,
              itemBuilder: (_, index){
                return Card(
                  child: ListTile(
                    title: Text(bouts[index].redFighter!.firstName!+' '+bouts[index].redFighter!.lastName!+' Vs '+bouts[index].blueFighter!.firstName!+' '+bouts[index].blueFighter!.lastName!),
                    subtitle: Text(''),
                    trailing: ElevatedButton(
                      child: const Text('Cancel'),
                      onPressed: (){
                        ref.read(boutsProvider.notifier).cancelBout(boutId: bouts[index].id!);
                      },
                    ),
                  ),
                );
              }
          );
        },
        error: (error, s) => Text(error.toString()),
        loading: () => const Center(
            child: CircularProgressIndicator(),
          )
    );
        }
}