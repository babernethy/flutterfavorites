import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobstate/app/models/global_state.dart';

final globalStateNotifier =
    StateNotifierProvider<GlobalStateNotifier, GlobalState>(
        (ref) => GlobalStateNotifier());

class GlobalStateNotifier extends StateNotifier<GlobalState> {
  GlobalStateNotifier()
      : lastIncremented = DateTime.now(),
        super(GlobalState(genreGamesPageNumber: 1));

  DateTime lastIncremented;

  void setGenre(String genre) {
    final newState = state.copyWith(currentGenre: genre);
    state = newState;
  }

  void setGenreId(int genreid) {
    final newState =
        state.copyWith(currentGenreId: genreid, genreGamesPageNumber: 1);
    state = newState;
  }

  void setGameId(int gameid) {
    final newState = state.copyWith(currentGameId: gameid);
    state = newState;
  }

  void decrementPageNumber() {
    if (state.genreGamesPageNumber! > 1 &&
        DateTime.now().difference(lastIncremented) >
            const Duration(seconds: 5)) {
      final newState =
          state.copyWith(genreGamesPageNumber: state.genreGamesPageNumber! - 1);
      state = newState;
      lastIncremented = DateTime.now();
    }
  }

  void incrementPageNumber() {
    if (DateTime.now().difference(lastIncremented) >
        const Duration(seconds: 5)) {
      final newState =
          state.copyWith(genreGamesPageNumber: state.genreGamesPageNumber! + 1);
      state = newState;
      lastIncremented = DateTime.now();
    }
  }

  void setGenreGamePageNumber(int number) {
    final newState = state.copyWith(genreGamesPageNumber: number);
    state = newState;
  }
}
