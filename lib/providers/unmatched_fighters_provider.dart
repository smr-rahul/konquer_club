import 'package:collection/collection.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konquer_club/providers/fighters_provider.dart';

import '../models/bout.dart';
import '../models/fighter.dart';
import '../services/konquer_service.dart';
import 'bouts_provider.dart';

final unmatchedFightersProvider = StateNotifierProvider<UnmatchedFightersNotifier, AsyncValue<List<Fighter>>>((ref) {
  return UnmatchedFightersNotifier(ref);
});

class UnmatchedFightersNotifier extends StateNotifier<AsyncValue<List<Fighter>>> {
  UnmatchedFightersNotifier(this.ref) : super(const AsyncValue.loading()) {
    getUnmatchedFighters();
  }
  Ref ref;

  Future getUnmatchedFighters() async {
    state = const AsyncValue.loading();
    final fighters = await ref.watch(fightersProvider.future);
    final bouts = await ref.watch(boutsProvider.future);
    List<Fighter> unmatched = [];
    for(Fighter fighter in fighters){
      var bout = bouts.firstWhereOrNull((bout) => bout.redFighter!.id == fighter.id || bout.blueFighter!.id == fighter.id);
      if(bout == null){
        unmatched.add(fighter);
      }
    }
    state = AsyncValue.data(unmatched);
  }


}