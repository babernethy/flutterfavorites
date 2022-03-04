import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobstate/extensions.dart';
import 'package:jobstate/pages/widgets/gameDetail.dart';
import 'package:jobstate/services/authnotifier.dart';
import 'package:jobstate/services/genrenotifier.dart';

class GamePage extends ConsumerWidget {
  GamePage(this.gameid, {Key? key}) : super(key: key);

  String? gameid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var game = ref.watch(gameDetailStateProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text(game != null ? game.name! : 'Loading'),
          // backgroundColor: game != null
          //     ? hexOrRGBToColor('#' + game.dominantColor!)
          //     : Colors.blue,
          actions: [
            IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  ref.watch(authStateProvider.notifier).signOut();
                }),
            IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  context.push('/settings');
                }),
          ],
        ),
        body: game != null
            ? GameDetailView(game)
            : const CircularProgressIndicator());
  }
}
