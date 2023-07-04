import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:riverpod_app/main.dart';
import 'package:riverpod_app/view_model.dart';

void main() {
  setUpAll(() async {
    // 最初に1回実施
    await loadAppFonts();
  });

  setUp(() async {
    // 各テスト開始時に実施
  });
  tearDown(() async {
    // 各テスト終了時に実施
  });
  tearDownAll(() async {
    // 最後に1回実施
  });

  testGoldens('normal', (tester) async {
    Device iPhone55 = const Device(
      name: 'iPhone 5.5',
      size: Size(414, 736),
      devicePixelRatio: 3.0,
    );

    List<Device> devices = [iPhone55];

    await tester.pumpWidgetBuilder(
      ProviderScope(
        child: MyHomePage(
          ViewModel(),
        ),
      ),
    );

    await multiScreenGolden(
      tester,
      'myHomePage_init',
      devices: devices,
    );
  });
}
