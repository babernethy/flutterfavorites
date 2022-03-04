// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'genre.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return _Genre.fromJson(json);
}

/// @nodoc
class _$GenreTearOff {
  const _$GenreTearOff();

  _Genre call(
      {int? id,
      String? name,
      String? slug,
      @JsonKey(name: 'games_count') int? gamesCount,
      @JsonKey(name: 'image_background') String? imageBackground,
      List<Game>? games}) {
    return _Genre(
      id: id,
      name: name,
      slug: slug,
      gamesCount: gamesCount,
      imageBackground: imageBackground,
      games: games,
    );
  }

  Genre fromJson(Map<String, Object?> json) {
    return Genre.fromJson(json);
  }
}

/// @nodoc
const $Genre = _$GenreTearOff();

/// @nodoc
mixin _$Genre {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'games_count')
  int? get gamesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_background')
  String? get imageBackground => throw _privateConstructorUsedError;
  List<Game>? get games => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenreCopyWith<Genre> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreCopyWith<$Res> {
  factory $GenreCopyWith(Genre value, $Res Function(Genre) then) =
      _$GenreCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      String? slug,
      @JsonKey(name: 'games_count') int? gamesCount,
      @JsonKey(name: 'image_background') String? imageBackground,
      List<Game>? games});
}

/// @nodoc
class _$GenreCopyWithImpl<$Res> implements $GenreCopyWith<$Res> {
  _$GenreCopyWithImpl(this._value, this._then);

  final Genre _value;
  // ignore: unused_field
  final $Res Function(Genre) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? gamesCount = freezed,
    Object? imageBackground = freezed,
    Object? games = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      gamesCount: gamesCount == freezed
          ? _value.gamesCount
          : gamesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      imageBackground: imageBackground == freezed
          ? _value.imageBackground
          : imageBackground // ignore: cast_nullable_to_non_nullable
              as String?,
      games: games == freezed
          ? _value.games
          : games // ignore: cast_nullable_to_non_nullable
              as List<Game>?,
    ));
  }
}

/// @nodoc
abstract class _$GenreCopyWith<$Res> implements $GenreCopyWith<$Res> {
  factory _$GenreCopyWith(_Genre value, $Res Function(_Genre) then) =
      __$GenreCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      String? slug,
      @JsonKey(name: 'games_count') int? gamesCount,
      @JsonKey(name: 'image_background') String? imageBackground,
      List<Game>? games});
}

/// @nodoc
class __$GenreCopyWithImpl<$Res> extends _$GenreCopyWithImpl<$Res>
    implements _$GenreCopyWith<$Res> {
  __$GenreCopyWithImpl(_Genre _value, $Res Function(_Genre) _then)
      : super(_value, (v) => _then(v as _Genre));

  @override
  _Genre get _value => super._value as _Genre;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? gamesCount = freezed,
    Object? imageBackground = freezed,
    Object? games = freezed,
  }) {
    return _then(_Genre(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      gamesCount: gamesCount == freezed
          ? _value.gamesCount
          : gamesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      imageBackground: imageBackground == freezed
          ? _value.imageBackground
          : imageBackground // ignore: cast_nullable_to_non_nullable
              as String?,
      games: games == freezed
          ? _value.games
          : games // ignore: cast_nullable_to_non_nullable
              as List<Game>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Genre implements _Genre {
  _$_Genre(
      {this.id,
      this.name,
      this.slug,
      @JsonKey(name: 'games_count') this.gamesCount,
      @JsonKey(name: 'image_background') this.imageBackground,
      this.games});

  factory _$_Genre.fromJson(Map<String, dynamic> json) =>
      _$$_GenreFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? slug;
  @override
  @JsonKey(name: 'games_count')
  final int? gamesCount;
  @override
  @JsonKey(name: 'image_background')
  final String? imageBackground;
  @override
  final List<Game>? games;

  @override
  String toString() {
    return 'Genre(id: $id, name: $name, slug: $slug, gamesCount: $gamesCount, imageBackground: $imageBackground, games: $games)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Genre &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.slug, slug) &&
            const DeepCollectionEquality()
                .equals(other.gamesCount, gamesCount) &&
            const DeepCollectionEquality()
                .equals(other.imageBackground, imageBackground) &&
            const DeepCollectionEquality().equals(other.games, games));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(slug),
      const DeepCollectionEquality().hash(gamesCount),
      const DeepCollectionEquality().hash(imageBackground),
      const DeepCollectionEquality().hash(games));

  @JsonKey(ignore: true)
  @override
  _$GenreCopyWith<_Genre> get copyWith =>
      __$GenreCopyWithImpl<_Genre>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenreToJson(this);
  }
}

abstract class _Genre implements Genre {
  factory _Genre(
      {int? id,
      String? name,
      String? slug,
      @JsonKey(name: 'games_count') int? gamesCount,
      @JsonKey(name: 'image_background') String? imageBackground,
      List<Game>? games}) = _$_Genre;

  factory _Genre.fromJson(Map<String, dynamic> json) = _$_Genre.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get slug;
  @override
  @JsonKey(name: 'games_count')
  int? get gamesCount;
  @override
  @JsonKey(name: 'image_background')
  String? get imageBackground;
  @override
  List<Game>? get games;
  @override
  @JsonKey(ignore: true)
  _$GenreCopyWith<_Genre> get copyWith => throw _privateConstructorUsedError;
}
