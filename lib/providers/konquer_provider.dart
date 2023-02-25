
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konquer_club/models/bout.dart';
import 'package:konquer_club/models/fighter.dart';
import 'package:konquer_club/providers/bouts_notifier.dart';
import 'package:konquer_club/providers/fighters_notifier.dart';

final boutsProvider = StateNotifierProvider<BoutsNotifier, List<Bout>>((ref) {
  return BoutsNotifier(ref: ref);
});
final fightersProvider = StateNotifierProvider<FightersNotifier, List<Fighter>>((ref) {
  return FightersNotifier(ref: ref);
});



final isLoadingBoutsProvider = StateProvider<bool>((ref) {
  return true;
});
final isLoadingFightersProvider = StateProvider<bool>((ref) {
  return true;
});
