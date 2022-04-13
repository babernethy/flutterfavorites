import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobstate/app/extensions.dart';
import 'package:jobstate/app/state/global_state_notifier.dart';
import 'package:jobstate/genres/state/genre_notifier.dart';
import 'package:jobstate/login/state/auth_notifier.dart';

class GenrePage extends HookConsumerWidget {
  const GenrePage(this.gidraw, {Key? key}) : super(key: key);

  final String? gidraw;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genreGamesStream = ref.watch(genreGameListStreamProvider);
    final appState = ref.watch(globalStateNotifier);

    final scrollController = useScrollController();

    scrollController.addListener(() {
      // final triggerFetchMoreSize =
      //     0.9 * scrollController.position.maxScrollExtent;

      if (scrollController.offset >
          scrollController.position.maxScrollExtent + 40) {
        final middle = scrollController.position.maxScrollExtent / 2;
        scrollController.animateTo(middle,
            curve: Curves.linear, duration: const Duration(milliseconds: 500));
        ref.read(globalStateNotifier.notifier).incrementPageNumber();

        print('need more');
      }

      if (scrollController.offset <=
          scrollController.position.minScrollExtent) {
        ref.read(globalStateNotifier.notifier).decrementPageNumber();

        print('need more');
      }
    });

    Widget _streamItemBuilder(BuildContext context, int index) {
      return genreGamesStream.when(
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
          data: (games) {
            return InkWell(
              child: Card(
                  color: Theme.of(context).colorScheme.surface,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (games[index].backgroundImage != null)
                          Image.network(
                            games[index].backgroundImage!,
                            width: 100,
                            height: 50,
                            fit: BoxFit.fitHeight,
                          ),
                        Flexible(
                            child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  games[index].name!,
                                  overflow: TextOverflow.fade,
                                  style: context.h2!.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                                ))),
                      ])),
              onTap: () {
                ref
                    .read(globalStateNotifier.notifier)
                    .setGameId(games[index].id!);
                context.push('/games/${games[index].slug!}');
              },
            );
          });
    }

    return Semantics(
        label: 'will this announce the page?',
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                '${gidraw!} - page ${appState.genreGamesPageNumber}',
              ),
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
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: genreGamesStream.when(
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) => Text('Error: $err'),
              data: (games) => ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.all(5.5),
                itemCount: games.length,
                itemBuilder: _streamItemBuilder, //_itemBuilder,
              ),
            )));
  }
}
