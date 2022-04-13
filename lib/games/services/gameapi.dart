import 'package:dio/dio.dart';
import 'package:jobstate/app/services/secrets.dart';
import 'package:jobstate/games/models/gamapiresult.gen.dart';
import 'package:jobstate/games/models/genregamesapireult.gen.dart';
import 'package:jobstate/games/services/igamerepo.dart';
import 'package:jobstate/genres/models/genre.dart';
import 'package:jobstate/genres/models/genreapiresult.gen.dart';

String gameAPIGenresUri =
    'https://rawg-video-games-database.p.rapidapi.com/genres?key=${Secrets.gameapikey}';
String gameAPIGameDetailsUri =
    'https://rawg-video-games-database.p.rapidapi.com/games';
String rapidAPIHost = 'rawg-video-games-database.p.rapidapi.com';

class GameAPI implements IGameRepo {
  @override
  Future<List<Genre>> getGenres() async {
    final response = await Dio().get(
      gameAPIGenresUri,
      options: Options(
        headers: {
          "x-rapidapi-host": rapidAPIHost,
          "x-rapidapi-key": Secrets.rapidapikey
        },
      ),
    );

    final genreResult = GenreAPIResult.fromJson(response.data);

    return genreResult.genres!;
  }

  @override
  Future<List<GameDetail>> getGamesByGenreId(String id, int page) async {
    List<GameDetail> outGames;

    final request1 =
        '$gameAPIGameDetailsUri?genres=$id&key=${Secrets.gameapikey}&page=$page';
    final response1 = await Dio().get(
      request1,
      options: Options(headers: {
        "x-rapidapi-host": rapidAPIHost,
        "x-rapidapi-key": Secrets.rapidapikey
      }),
    );

    final gameResult1 = GenreGamesApiResult.fromJson(response1.data);

    if (page > 1) {
      final request2 =
          '$gameAPIGameDetailsUri?genre=$id&page=2&key=${Secrets.gameapikey}&${page - 1}';
      final response2 = await Dio().get(
        request2,
        options: Options(headers: {
          "x-rapidapi-host": rapidAPIHost,
          "x-rapidapi-key": Secrets.rapidapikey
        }),
      );

      final gameResult2 = GenreGamesApiResult.fromJson(response2.data);
      outGames = gameResult1.results! + gameResult2.results!;
    } else {
      outGames = gameResult1.results!;
    }

    return outGames; // + gameResult2.results!;
  }

  @override
  Future<GameDetail> getGameDetailById(String id) async {
    final request = '$gameAPIGameDetailsUri/$id?key=${Secrets.gameapikey}';
    final response = await Dio().get(
      request,
      options: Options(headers: {
        "x-rapidapi-host": rapidAPIHost,
        "x-rapidapi-key": Secrets.rapidapikey
      }),
    );

    final gameResult = GameDetail.fromJson(response.data);

    return gameResult;
  }
}
