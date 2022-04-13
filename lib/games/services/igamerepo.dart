import 'package:jobstate/games/models/gamapiresult.gen.dart';
import 'package:jobstate/genres/models/genre.dart';

abstract class IGameRepo {
  Future<List<Genre>> getGenres();
  Future<GameDetail> getGameDetailById(String id);
  Future<List<GameDetail>> getGamesByGenreId(String id, int page);
}
