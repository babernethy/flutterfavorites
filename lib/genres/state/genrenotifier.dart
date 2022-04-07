import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobstate/games/models/gamapiresult.dart';
import 'package:jobstate/games/models/game.dart';
import 'package:jobstate/games/services/gameapi.dart';
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
    if (_genres == null) {
      final api = GameAPI();
      _genres = await api.getGenres();
      state = _genres!;
    }
  }
}

final gameDetailStateProvider =
    StateNotifierProvider<GameNotifier, GameDetail?>((ref) {
  return GameNotifier();
});

class GameNotifier extends StateNotifier<GameDetail?> {
  GameNotifier() : super(null);

  Future<void> getGameById(String id) async {
    final api = GameAPI();
    state = await api.getGameDetailById(id);
  }
}