// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'global_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GlobalStateTearOff {
  const _$GlobalStateTearOff();

  _GlobalState call(
      {String? currentGenre,
      int? currentGenreId,
      int? genreGamesPageNumber,
      int? currentGameId}) {
    return _GlobalState(
      currentGenre: currentGenre,
      currentGenreId: currentGenreId,
      genreGamesPageNumber: genreGamesPageNumber,
      currentGameId: currentGameId,
    );
  }
}

/// @nodoc
const $GlobalState = _$GlobalStateTearOff();

/// @nodoc
mixin _$GlobalState {
  String? get currentGenre => throw _privateConstructorUsedError;
  int? get currentGenreId => throw _privateConstructorUsedError;
  int? get genreGamesPageNumber => throw _privateConstructorUsedError;
  int? get currentGameId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GlobalStateCopyWith<GlobalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalStateCopyWith<$Res> {
  factory $GlobalStateCopyWith(
          GlobalState value, $Res Function(GlobalState) then) =
      _$GlobalStateCopyWithImpl<$Res>;
  $Res call(
      {String? currentGenre,
      int? currentGenreId,
      int? genreGamesPageNumber,
      int? currentGameId});
}

/// @nodoc
class _$GlobalStateCopyWithImpl<$Res> implements $GlobalStateCopyWith<$Res> {
  _$GlobalStateCopyWithImpl(this._value, this._then);

  final GlobalState _value;
  // ignore: unused_field
  final $Res Function(GlobalState) _then;

  @override
  $Res call({
    Object? currentGenre = freezed,
    Object? currentGenreId = freezed,
    Object? genreGamesPageNumber = freezed,
    Object? currentGameId = freezed,
  }) {
    return _then(_value.copyWith(
      currentGenre: currentGenre == freezed
          ? _value.currentGenre
          : currentGenre // ignore: cast_nullable_to_non_nullable
              as String?,
      currentGenreId: currentGenreId == freezed
          ? _value.currentGenreId
          : currentGenreId // ignore: cast_nullable_to_non_nullable
              as int?,
      genreGamesPageNumber: genreGamesPageNumber == freezed
          ? _value.genreGamesPageNumber
          : genreGamesPageNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      currentGameId: currentGameId == freezed
          ? _value.currentGameId
          : currentGameId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$GlobalStateCopyWith<$Res>
    implements $GlobalStateCopyWith<$Res> {
  factory _$GlobalStateCopyWith(
          _GlobalState value, $Res Function(_GlobalState) then) =
      __$GlobalStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? currentGenre,
      int? currentGenreId,
      int? genreGamesPageNumber,
      int? currentGameId});
}

/// @nodoc
class __$GlobalStateCopyWithImpl<$Res> extends _$GlobalStateCopyWithImpl<$Res>
    implements _$GlobalStateCopyWith<$Res> {
  __$GlobalStateCopyWithImpl(
      _GlobalState _value, $Res Function(_GlobalState) _then)
      : super(_value, (v) => _then(v as _GlobalState));

  @override
  _GlobalState get _value => super._value as _GlobalState;

  @override
  $Res call({
    Object? currentGenre = freezed,
    Object? currentGenreId = freezed,
    Object? genreGamesPageNumber = freezed,
    Object? currentGameId = freezed,
  }) {
    return _then(_GlobalState(
      currentGenre: currentGenre == freezed
          ? _value.currentGenre
          : currentGenre // ignore: cast_nullable_to_non_nullable
              as String?,
      currentGenreId: currentGenreId == freezed
          ? _value.currentGenreId
          : currentGenreId // ignore: cast_nullable_to_non_nullable
              as int?,
      genreGamesPageNumber: genreGamesPageNumber == freezed
          ? _value.genreGamesPageNumber
          : genreGamesPageNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      currentGameId: currentGameId == freezed
          ? _value.currentGameId
          : currentGameId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_GlobalState implements _GlobalState {
  _$_GlobalState(
      {this.currentGenre,
      this.currentGenreId,
      this.genreGamesPageNumber,
      this.currentGameId});

  @override
  final String? currentGenre;
  @override
  final int? currentGenreId;
  @override
  final int? genreGamesPageNumber;
  @override
  final int? currentGameId;

  @override
  String toString() {
    return 'GlobalState(currentGenre: $currentGenre, currentGenreId: $currentGenreId, genreGamesPageNumber: $genreGamesPageNumber, currentGameId: $currentGameId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GlobalState &&
            const DeepCollectionEquality()
                .equals(other.currentGenre, currentGenre) &&
            const DeepCollectionEquality()
                .equals(other.currentGenreId, currentGenreId) &&
            const DeepCollectionEquality()
                .equals(other.genreGamesPageNumber, genreGamesPageNumber) &&
            const DeepCollectionEquality()
                .equals(other.currentGameId, currentGameId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentGenre),
      const DeepCollectionEquality().hash(currentGenreId),
      const DeepCollectionEquality().hash(genreGamesPageNumber),
      const DeepCollectionEquality().hash(currentGameId));

  @JsonKey(ignore: true)
  @override
  _$GlobalStateCopyWith<_GlobalState> get copyWith =>
      __$GlobalStateCopyWithImpl<_GlobalState>(this, _$identity);
}

abstract class _GlobalState implements GlobalState {
  factory _GlobalState(
      {String? currentGenre,
      int? currentGenreId,
      int? genreGamesPageNumber,
      int? currentGameId}) = _$_GlobalState;

  @override
  String? get currentGenre;
  @override
  int? get currentGenreId;
  @override
  int? get genreGamesPageNumber;
  @override
  int? get currentGameId;
  @override
  @JsonKey(ignore: true)
  _$GlobalStateCopyWith<_GlobalState> get copyWith =>
      throw _privateConstructorUsedError;
}
