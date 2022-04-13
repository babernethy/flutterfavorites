import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobstate/app/state/global_state_notifier.dart';
import 'package:jobstate/games/models/gamapiresult.gen.dart';
import 'package:jobstate/games/services/game_repo.dart';

final gameDetailProvider = FutureProvider<GameDetail>((ref) async {
  final appState = ref.watch(globalStateNotifier);
  final api = GameRepo();
  return api.getGameDetailById(appState.currentGameId.toString());
});

final gameDetailStream = StreamProvider<GameDetail>((ref) async* {
  final appState = ref.watch(globalStateNotifier);
  final api = GameRepo();
  yield GameDetail(name: 'Loading');
  yield await api.getGameDetailById(appState.currentGameId.toString());
});
