import 'package:dio/dio.dart';
import 'package:jobstate/core/services/constants.dart';
import 'package:jobstate/core/services/secrets.dart';
import 'package:jobstate/games/models/gamapiresult.dart';
import 'package:jobstate/genres/models/genre.dart';
import 'package:jobstate/genres/models/genreapiresult.dart';

abstract class IGameAPI {
  Future<List<Genre>> getGenres();
  Future<GameDetail> getGameDetailById(String id);
}

class GameAPI implements IGameAPI {
  @override
  Future<List<Genre>> getGenres() async {
    final response = await Dio().get(
      gameAPIGenresUri,
      options: Options(headers: {
        "x-rapidapi-host": rapidAPIHost,
        "x-rapidapi-key": Secrets.rapidapikey
      }),
    );

    final genreResult = GenreAPIResult.fromJson(response.data);

    return genreResult.genres!;
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
