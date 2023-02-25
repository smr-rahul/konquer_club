import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:konquer_club/models/bout.dart';
import '../providers/konquer_provider.dart';

class MatchList extends ConsumerWidget {
  const MatchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bouts =  ref.watch(boutsProvider);
    final isLoading = ref.watch(isLoadingBoutsProvider);
    return isLoading
        ? const Center(
          child: CircularProgressIndicator(),
        )
        : ListView.builder(
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
        }

    //   _data.when(
    //     data: (_data){
    //       List<Bout> bouts = _data.map((e) => e).toList();
    //
    //       return ListView.builder(
    //           itemCount: bouts.length,
    //           itemBuilder: (_, index){
    //             return Card(
    //               child: ListTile(
    //                 title: Text(bouts[index].redFighter!.firstName!+' '+bouts[index].redFighter!.lastName!+' Vs '+bouts[index].blueFighter!.firstName!+' '+bouts[index].blueFighter!.lastName!),
    //                 subtitle: Text(''),
    //                 trailing: ElevatedButton(
    //                   child: const Text('Cancel'),
    //                   onPressed: (){
    //
    //                   },
    //                 ),
    //               ),
    //             );
    //           }
    //       );
    //     },
    //     error: (err, stack) => Text(err.toString()),
    //     loading: () => const Center(
    //       child: CircularProgressIndicator(),
    //     )
    // );
  //}
}