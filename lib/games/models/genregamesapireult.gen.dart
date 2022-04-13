// ignore: invalid_assignment
import 'package:jobstate/games/models/gamapiresult.gen.dart';

class GenreGamesApiResult {
  int? count;
  String? next;
  String? previous;
  List<GameDetail>? results;

  String? description;

  GenreGamesApiResult({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  GenreGamesApiResult.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = List<GameDetail>.empty(growable: true);
      json['results'].forEach((v) {
        results!.add(GameDetail.fromJson(v));
      });
    }
    description = json['description'];
  }

  static const fromJsonConverter = GenreGamesApiResult.fromJson;
}
