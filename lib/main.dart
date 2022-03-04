import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobstate/pages/game.dart';
import 'package:jobstate/pages/genre.dart';
import 'package:jobstate/pages/genres.dart';
import 'package:jobstate/pages/home.dart';
import 'package:jobstate/pages/login.dart';
import 'package:jobstate/pages/settings.dart';
import 'package:jobstate/services/authnotifier.dart';
import 'package:jobstate/services/loggerprovider.dart';

void main() {
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  runApp(ProviderScope(observers: [LoggerProvider()], child: const MyApp()));
}

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
            return GamePage(state.params['gid']);
          },
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => Login(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsPage(),
        ),
      ],

      // redirect to the login page if the user is not logged in
      redirect: (state) {
        // if the user is not logged in, they need to login
        final loggedIn = ref.watch(authStateProvider).isLoggedIn;
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
    );
  }
}
