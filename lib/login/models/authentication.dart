import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobstate/login/models/user.dart';

part 'authentication.freezed.dart';

@freezed
class Authentication with _$Authentication {
  factory Authentication({
    User? user,
  }) = _Authentication;
  bool get isLoggedIn => user != null;
  const Authentication._();
}
