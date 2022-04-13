import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobstate/app/myapp.dart';
import 'package:jobstate/app/services/logger_provider.dart';
import 'package:logging/logging.dart';

void main() {
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  _setupLogging();

  runApp(ProviderScope(observers: [LoggerProvider()], child: const MyApp()));
  RendererBinding.instance!.setSemanticsEnabled(true);
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
