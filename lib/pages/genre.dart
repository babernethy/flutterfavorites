import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobstate/services/authnotifier.dart';
import 'package:jobstate/services/genrenotifier.dart';

class GenrePage extends HookConsumerWidget {
  const GenrePage(this.gidraw, {Key? key}) : super(key: key);

  final String? gidraw;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var genregames = ref.watch(genreGamesListProvider);

    Widget _itemBuilder(BuildContext context, int index) {
      return InkWell(
        child: Card(
          child: Center(
              child: Column(children: [
            Text(
              genregames[index].name!,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.orange,
              ),
            ),
          ])),
        ),
        onTap: () {
          ref
              .read(gameDetailStateProvider.notifier)
              .getGameById(genregames[index].id.toString());
          context.push('/games/${genregames[index].id!}');
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(gidraw!),
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView.builder(
        padding: const EdgeInsets.all(5.5),
        itemCount: genregames.length,
        itemBuilder: _itemBuilder,
      ),
    );
  }
}
