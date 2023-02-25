import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konquer_club/models/bout.dart';

import '../services/konquer_service.dart';
import 'konquer_provider.dart';

class BoutsNotifier extends StateNotifier<List<Bout>> {
  BoutsNotifier({required this.ref}) : super([]) {
    fetchBouts(ref: ref);
  }
  final Ref ref;

  Future fetchBouts({required Ref ref}) async {
    await ref
        .read(konquerServiceProvider)
        .loadBouts()
        .then((value) {
      state = value;
      ref.read(isLoadingBoutsProvider.notifier).state = false;
    });
  }

  void cancelBout({required int boutId}) async{
    await ref
        .read(konquerServiceProvider)
        .cancelBout(boutId)
        .then((value) {
          if(value){
            final canceledBout = state
                .firstWhere((element) => element.id == boutId);
            state.remove(canceledBout);
            state = [...state];
          }

    });

  }
}