import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = Provider<String>((ref) {
  return 'Riverpod Demo Page';
});

final descriptionProvider = Provider<String>((ref) {
  return 'You have pushed the button this many times:';
});

final countProvider = StateProvider<int>((ref) {
  return 0;
});
