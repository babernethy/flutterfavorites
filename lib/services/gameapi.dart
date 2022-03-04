import 'package:jobstate/models/gamapiresult.dart';
import 'package:jobstate/models/genre.dart';
import 'package:dio/dio.dart';
import 'package:jobstate/models/genreapiresult.dart';
import 'package:jobstate/services/constants.dart';
import 'package:jobstate/services/secrets.dart';

abstract class IGameAPI {
  Future<List<Genre>> getGenres();
  Future<GameDetail> getGameDetailById(String id);
}

class GameAPI implements IGameAPI {
  @override
  Future<List<Genre>> getGenres() async {
    var response = await Dio().get(
      gameAPIGenresUri,
      options: Options(headers: {
        "x-rapidapi-host": rapidAPIHost,
        "x-rapidapi-key": Secrets.rapidapikey
      }),
    );

    var genreResult = GenreAPIResult.fromJson(response.data);

    return genreResult.genres!;
  }

  @override
  Future<GameDetail> getGameDetailById(String id) async {
    var request = '$gameAPIGameDetailsUri/$id?key=${Secrets.gameapikey}';
    var response = await Dio().get(
      request,
      options: Options(headers: {
        "x-rapidapi-host": rapidAPIHost,
        "x-rapidapi-key": Secrets.rapidapikey
      }),
    );

    var gameResult = GameDetail.fromJson(response.data);

    return gameResult;
  }
}
