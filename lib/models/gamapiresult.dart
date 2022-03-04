import 'package:jobstate/models/genre.dart';

class GameDetail {
  int? id;
  String? slug;
  String? name;
  String? nameOriginal;
  String? description;
  int? metacritic;
  String? released;
  bool? tba;
  String? backgroundImage;
  String? backgroundImageAdditional;
  String? website;
  double? rating;
  String? saturatedColor;
  String? dominantColor;
  List<Platforms>? platforms;
  List<Genre>? genres;
  String? descriptionRaw;

  GameDetail(
      {this.id,
      this.slug,
      this.name,
      this.nameOriginal,
      this.description,
      this.metacritic,
      this.released,
      this.tba,
      this.backgroundImage,
      this.backgroundImageAdditional,
      this.website,
      this.rating,
      this.saturatedColor,
      this.dominantColor,
      this.platforms,
      this.genres,
      this.descriptionRaw});

  GameDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    nameOriginal = json['name_original'];
    description = json['description'];
    metacritic = json['metacritic'];
    released = json['released'];
    tba = json['tba'];
    backgroundImage = json['background_image'];
    backgroundImageAdditional = json['background_image_additional'];
    website = json['website'];
    rating = json['rating'];
    saturatedColor = json['saturated_color'];
    dominantColor = json['dominant_color'];
    descriptionRaw = json['description_raw'];
  }
}

class Ratings {
  int? id;
  String? title;
  int? count;
  double? percent;

  Ratings({this.id, this.title, this.count, this.percent});

  Ratings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    count = json['count'];
    percent = json['percent'];
  }
}

class Platforms {
  Platform? platform;
  String? releasedAt;
  Requirements? requirements;

  Platforms({this.platform, this.releasedAt, this.requirements});

  Platforms.fromJson(Map<String, dynamic> json) {
    platform =
        json['platform'] != null ? Platform.fromJson(json['platform']) : null;
    releasedAt = json['released_at'];
    requirements = json['requirements'] != null
        ? Requirements.fromJson(json['requirements'])
        : null;
  }
}

class Platform {
  int? id;
  String? name;
  String? slug;
  String? image;
  int? yearEnd;
  int? yearStart;
  int? gamesCount;
  String? imageBackground;

  Platform(
      {this.id,
      this.name,
      this.slug,
      this.image,
      this.yearEnd,
      this.yearStart,
      this.gamesCount,
      this.imageBackground});

  Platform.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    yearEnd = json['year_end'];
    yearStart = json['year_start'];
    gamesCount = json['games_count'];
    imageBackground = json['image_background'];
  }
}

class Requirements {
  String? minimum;
  String? recommended;

  Requirements({this.minimum, this.recommended});

  Requirements.fromJson(Map<String, dynamic> json) {
    minimum = json['minimum'];
    recommended = json['recommended'];
  }
}

class Tags {
  int? id;
  String? name;
  String? slug;
  String? language;
  int? gamesCount;
  String? imageBackground;

  Tags(
      {this.id,
      this.name,
      this.slug,
      this.language,
      this.gamesCount,
      this.imageBackground});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    language = json['language'];
    gamesCount = json['games_count'];
    imageBackground = json['image_background'];
  }
}
