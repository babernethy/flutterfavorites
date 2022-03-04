import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobstate/models/user.dart';

part 'authentication.freezed.dart';

@freezed
class Authentication with _$Authentication {
  const Authentication._();
  factory Authentication({
    User? user,
  }) = _Authentication;
  bool get isLoggedIn => user != null;
}
