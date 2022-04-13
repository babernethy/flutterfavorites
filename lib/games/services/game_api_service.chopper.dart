// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$GameAPIChopperService extends GameAPIChopperService {
  _$GameAPIChopperService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = GameAPIChopperService;

  @override
  Future<Response<GenreAPIResult>> getGenresResult() {
    final $url = '/genres';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<GenreAPIResult, GenreAPIResult>($request);
  }

  @override
  Future<Response<GameDetail>> getGameDetailByIdResponse(String id) {
    final $url = '/games/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<GameDetail, GameDetail>($request);
  }

  @override
  Future<Response<GenreGamesApiResult>> getGamesByGenreIdResponse(
      String genre, int page) {
    final $url = '/games';
    final $params = <String, dynamic>{'genre': genre, 'page': page};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<GenreGamesApiResult, GenreGamesApiResult>($request);
  }
}
