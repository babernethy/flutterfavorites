import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TextControllerNotifier
    extends StateNotifier<List<AutoDisposeProvider<TextEditingController>>> {
  TextControllerNotifier({String? text}) : super([]);

  AutoDisposeProvider<TextEditingController> _createControllerProvider() {
    return Provider.autoDispose((ref) => TextEditingController());
  }

  void add() {
    state = [...state, _createControllerProvider()];
  }

  void remove(int index) {
    if (index < 0 || index >= state.length) {
      return;
    }
    final target = state[index];
    state.remove(target);
    state = [...state];
  }
}
