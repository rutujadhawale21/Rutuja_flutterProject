import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeProvider extends StateNotifier<bool> {
  final Ref ref;

  ThemeProvider(this.ref) : super(false);

  void toggleTheme() async {
    state = !state;
  }
}

final themeProvider =
    StateNotifierProvider<ThemeProvider, bool>((ref) => ThemeProvider(ref));
