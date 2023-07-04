import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/data/count_data.dart';

final titleProvider = Provider<String>((ref) {
  return 'Riverpod Demo Page';
});

final descriptionProvider = Provider<String>((ref) {
  return 'You have pushed the button this many times:';
});

final countProvider = StateProvider<int>((ref) {
  return 0;
});

final countDataProvider = StateProvider<CountData>(
    (ref) => CountData(count: 0, countUp: 0, countDown: 0));
