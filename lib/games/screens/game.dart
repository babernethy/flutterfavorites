import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobstate/games/state/gamenotifier.dart';
import 'package:jobstate/games/widgets/gameDetail.dart';
import 'package:jobstate/login/state/auth_notifier.dart';

class GamePage extends ConsumerWidget {
  const GamePage(this.gameid, {Key? key}) : super(key: key);

  final String gameid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final game = ref.watch(gameDetailStateProvider);
    // final gameAsyncValue = ref.watch(gameDetailProvider);
    final gameStreamValue = ref.watch(gameDetailStream);
    return Scaffold(
      appBar: AppBar(
        title: Text(gameStreamValue.when(
            loading: () => 'Loading',
            error: (err, stack) => 'Error',
            data: (game) => game.name!)),
        actions: [
          IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () {
                ref.watch(authStateProvider.notifier).signOut();
              }),
          IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Settings',
              onPressed: () {
                context.push('/settings');
              }),
        ],
      ),
      body: gameStreamValue.when(
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
          data: (game) {
            return game.name == 'Loading'
                ? const CircularProgressIndicator()
                : GameDetailView(game);
          }),

      // gameAsyncValue.maybeWhen<Widget>(
      //     orElse: () => const CircularProgressIndicator(),
      //     data: (game) => GameDetailView(game))

      // game != null
      //     ? GameDetailView(game)
      //     : const CircularProgressIndicator()
    );
  }
}
