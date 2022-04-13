import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_state.freezed.dart';

@freezed
class GlobalState with _$GlobalState {
  factory GlobalState({
    String? currentGenre,
    int? currentGenreId,
    int? genreGamesPageNumber,
    int? currentGameId,
  }) = _GlobalState;
}
