import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobstate/app/state/global_state_notifier.dart';
import 'package:jobstate/games/models/gamapiresult.gen.dart';
import 'package:jobstate/games/models/game.dart';
import 'package:jobstate/games/services/game_repo.dart';
import 'package:jobstate/genres/models/genre.dart';

final genreGamesProvider = StateProvider<String>((ref) => '');

final genreGamesListProvider = Provider<List<Game>>((ref) {
  final genre = ref.watch(genreGamesProvider);
  final genres = ref.watch(genreStateProvider);

  return genres.where((element) => element.name == genre).first.games!;
});

final genreStateProvider =
    StateNotifierProvider<GenreNotifier, List<Genre>>((ref) {
  return GenreNotifier();
});

class GenreNotifier extends StateNotifier<List<Genre>> {
  GenreNotifier() : super(List<Genre>.empty()) {
    getGenres();
  }

  List<Genre>? _genres;

  Future<void> getGenres() async {
    final api = GameRepo();

    if (_genres == null) {
      state = await api.getGenres();
    }
  }
}

final genreGameListStreamProvider =
    StreamProvider<List<GameDetail>>((ref) async* {
  final appState = ref.watch(globalStateNotifier);
  final api = GameRepo();
  //await Future.delayed(const Duration(seconds: 5));
  yield await api.getGamesByGenreId(
      appState.currentGenreId.toString(), appState.genreGamesPageNumber!);
});
