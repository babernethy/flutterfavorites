import 'package:jobstate/core/services/secrets.dart';

String gameAPIGenresUri =
    'https://rawg-video-games-database.p.rapidapi.com/genres?key=${Secrets.gameapikey}';
String gameAPIGameDetailsUri =
    'https://rawg-video-games-database.p.rapidapi.com/games';
String rapidAPIHost = 'rawg-video-games-database.p.rapidapi.com';

double maxBodyWidth = 1000;
double edgePadding = 12;
double expandWidth = 225;
double shrinkWidth = 60;
