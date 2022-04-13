import "dart:async";

import 'package:chopper/chopper.dart';
import 'package:jobstate/games/models/gamapiresult.gen.dart';
import 'package:jobstate/games/models/genregamesapireult.gen.dart';
import 'package:jobstate/genres/models/genreapiresult.gen.dart';

part 'game_api_service.chopper.dart';

@ChopperApi()
abstract class GameAPIChopperService extends ChopperService {
  static GameAPIChopperService create([ChopperClient? client]) =>
      _$GameAPIChopperService(client);

  @Get(path: '/genres')
  Future<Response<GenreAPIResult>> getGenresResult();
  @Get(path: '/games/{id}')
  Future<Response<GameDetail>> getGameDetailByIdResponse(@Path() String id);
  @Get(path: '/games')
  Future<Response<GenreGamesApiResult>> getGamesByGenreIdResponse(
      @Query() String genre, @Query() int page);
}
