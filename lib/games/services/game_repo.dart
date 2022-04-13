import "dart:async";

import 'package:chopper/chopper.dart';
import 'package:jobstate/app/services/json_to_type_converter.dart';
import 'package:jobstate/app/services/secrets.dart';
import 'package:jobstate/games/models/gamapiresult.gen.dart';
import 'package:jobstate/games/models/genregamesapireult.gen.dart';
import 'package:jobstate/games/services/game_api_service.dart';
import 'package:jobstate/games/services/igamerepo.dart';
import 'package:jobstate/genres/models/genre.dart';
import 'package:jobstate/genres/models/genreapiresult.gen.dart';

class GameRepo implements IGameRepo {
  final gameApiService = GameAPIChopperService.create(gameAPIClient);

  @override
  Future<List<Genre>> getGenres() async {
    final output = await gameApiService.getGenresResult();
    return output.body!.genres!;
  }

  @override
  Future<GameDetail> getGameDetailById(String genres) async {
    final output = await gameApiService.getGameDetailByIdResponse(genres);
    return output.body!;
  }

  @override
  Future<List<GameDetail>> getGamesByGenreId(String genre, int page) async {
    final output = await gameApiService.getGamesByGenreIdResponse(genre, page);
    return output.body!.results!;
  }
}

String rapidAPIHost = 'rawg-video-games-database.p.rapidapi.com';
String rapidBaseUrl = 'https://rawg-video-games-database.p.rapidapi.com';

final gameAPIClient = ChopperClient(
  baseUrl: rapidBaseUrl,
  converter: const JsonToTypeConverter({
    GenreAPIResult: GenreAPIResult.fromJsonConverter,
    GenreGamesApiResult: GenreGamesApiResult.fromJsonConverter,
    GameDetail: GameDetail.fromJsonConverter
  }),
  interceptors: [HttpLoggingInterceptor(), rapidHeaders, addAPIKey],
);

Future<Request> rapidHeaders(Request request) async => applyHeaders(request,
    {'x-rapidapi-host': rapidAPIHost, 'x-rapidapi-key': Secrets.rapidapikey});

Future<Request> addAPIKey(Request request) async {
  final parms = <String, dynamic>{};
  parms.addAll(request.parameters);
  parms.addAll({'key': Secrets.gameapikey});

  return request.copyWith(parameters: parms);
}
