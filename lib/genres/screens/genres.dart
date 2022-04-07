import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobstate/genres/models/genre.dart';
import 'package:jobstate/genres/state/genrenotifier.dart';
import 'package:jobstate/login/state/authnotifier.dart';

class GenresPage extends ConsumerWidget {
  const GenresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genreList = ref.watch(genreStateProvider);

    final double cardWidth =
        kIsWeb ? 200 : MediaQuery.of(context).size.width / 2;
    final double cardHeight = .75 * cardWidth;

    Widget genreItem(Genre g) {
      return InkWell(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(g.imageBackground!), fit: BoxFit.cover)),
          height: cardHeight,
          width: cardWidth,
          child: Text(
            '${g.name} (${g.gamesCount})',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        onTap: () {
          ref.read(genreGamesProvider.notifier).state = g.name!;
          context.push('/genres/${g.name!}');
        },
      );
    }

    Widget genreWrap() {
      return Wrap(
        // direction: Axis.vertical,
        children: genreList.map((i) => genreItem(i)).toList(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title:
            Text('Genres', style: Theme.of(context).appBarTheme.titleTextStyle),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
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
      body: SingleChildScrollView(child: genreWrap()),
    );
  }
}
