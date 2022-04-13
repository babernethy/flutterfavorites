import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobstate/login/models/authentication.dart';
import 'package:jobstate/login/models/user.dart';

final authStateProvider =
    StateNotifierProvider<AuthNotifier, Authentication>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<Authentication> {
  AuthNotifier() : super(Authentication());

  Future<void> signIn(String email, String password) async {
    final newState = state.copyWith(user: User(id: 1, name: email));
    state = newState;
  }

  Future<void> signOut() async {
    final newState = state.copyWith(user: null);
    state = newState;
  }

  // Future<void> increment() async {
  //   final newState = state.copyWith(counter: state.counter + 1);
  //   state = newState;
  // }

  // Future<void> setLoginUserId(String userid) async {
  //   final newState = state.copyWith(loginUserId: userid);
  //   state = newState;
  // }
}
