import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/fighter.dart';
import '../services/konquer_service.dart';
import 'konquer_provider.dart';

class FightersNotifier extends StateNotifier<List<Fighter>> {
  FightersNotifier({required this.ref}) : super([]) {
    fetchFighters(ref: ref);
  }
  final Ref ref;

  Future fetchFighters({required Ref ref}) async {
    await ref
        .read(konquerServiceProvider)
        .loadFighters()
        .then((value) {
      state = value;
      ref.read(isLoadingFightersProvider.notifier).state = false;
    });
  }

  // void updateFighter({required int redFighterId, required int blueFighterId}) async{
  //    List<Fighter> fighters = state
  //       .where((element) => element.id == redFighterId || element.id == blueFighterId ).toList();
  //   for(Fighter fighter in fighters){
  //     fighter.usaBoxingId = null;
  //   }
  //
  //   state = [
  //     for (int i = 0; i < state.length; i++)
  //       if (state[i].id == fighters[0].id) fighters[0]
  //       else if (state[i].id == fighters[1].id) fighters[1]
  //       else state[i]
  //   ];
  //
  // }

}
