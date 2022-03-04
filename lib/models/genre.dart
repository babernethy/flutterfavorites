import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobstate/models/game.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

@freezed
class Genre with _$Genre {
  factory Genre(
      {int? id,
      String? name,
      String? slug,
      @JsonKey(name: 'games_count') int? gamesCount,
      @JsonKey(name: 'image_background') String? imageBackground,
      List<Game>? games}) = _Genre;
  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
