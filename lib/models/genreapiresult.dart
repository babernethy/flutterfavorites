import 'package:jobstate/models/genre.dart';

//https://jsontodart.com/

class GenreAPIResult {
  int? count;
  int? next;
  int? previous;
  List<Genre>? genres;

  GenreAPIResult({this.count, this.next, this.previous, this.genres});

  GenreAPIResult.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      genres = List<Genre>.empty(growable: true);
      json['results'].forEach((v) {
        genres!.add(Genre.fromJson(v));
      });
    }
  }
}
