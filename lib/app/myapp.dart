import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobstate/app/screens/settings.dart';
import 'package:jobstate/games/screens/game.dart';
import 'package:jobstate/genres/screens/genre.dart';
import 'package:jobstate/genres/screens/genres.dart';
import 'package:jobstate/login/screens/login.dart';
import 'package:jobstate/login/state/auth_notifier.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppThemeState currentThemeState = ref.watch(appThemeNotifier);
    late final _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const GenresPage(),
        ),
        GoRoute(
          path: '/genres/:gid',
          builder: (context, state) {
            return GenrePage(state.params['gid']);
          },
        ),
        GoRoute(
          path: '/games/:gid',
          builder: (context, state) {
            return GamePage(state.params['gid'].toString());
          },
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const Login(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsPage(),
        ),
      ],

      //redirect to the login page if the user is not logged in
      redirect: (state) {
        // if the user is not logged in, they need to login
        final bool loggedIn = ref.watch(authStateProvider).isLoggedIn;
        final loggingIn = state.subloc == '/login';
        if (!loggedIn) return loggingIn ? null : '/login';
        // if the user is logged in but still on the login page, send them to
        // the home page
        if (loggingIn) return '/';
        // no need to redirect at all
        return null;
      },
    );

    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      theme: currentThemeState.lightTheme,
      darkTheme: currentThemeState.darkTheme,
      themeMode: currentThemeState.themeMode,
      //showSemanticsDebugger: true,
    );
  }
}
