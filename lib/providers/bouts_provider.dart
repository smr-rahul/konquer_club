import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konquer_club/models/bout.dart';

import '../services/konquer_service.dart';

final boutsProvider = StateNotifierProvider<BoutsNotifier, AsyncValue<List<Bout>>>((ref) {
  final serviceProvider = ref.watch(konquerServiceProvider);
  return BoutsNotifier(serviceProvider);
});



class BoutsNotifier extends StateNotifier<AsyncValue<List<Bout>>> {
  BoutsNotifier(this.service) : super(const AsyncValue.loading()) {
    fetchBouts();
  }
  final KonquerService service;

  Future fetchBouts() async {
    state = const AsyncValue.loading();

    try {
      final data = await service.loadBouts();
      state = AsyncValue.data(data);
    }  on Exception catch(e) {
      state = AsyncValue.error(e, stackTrace: StackTrace.current);
    }
  }

  void cancelBout({required int boutId}) async{
    await service
        .cancelBout(boutId)
        .then((value) {
          if(value && state.asData != null){
            List<Bout> list = state.asData!.value;
            final canceledBout = list
                .firstWhere((element) => element.id == boutId);
            list.remove(canceledBout);
            state = AsyncValue.data(list) ;
          }

    });

  }
}