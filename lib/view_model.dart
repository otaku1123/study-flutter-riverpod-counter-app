import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/data/count_data.dart';
import 'package:riverpod_app/logic.dart';
import 'package:riverpod_app/provider.dart';
import 'package:riverpod_app/sound_logic.dart';

class ViewModel {
  final Logic _logic = Logic();

  final SoundLogic _soundLogic = SoundLogic();

  late WidgetRef _ref;

  void setRef(WidgetRef ref) {
    _ref = ref;
  }

  void init() {
    _soundLogic.init();
  }

  void dispose() {
    _soundLogic.dispose();
  }

  get count => _ref.watch(countDataProvider).count.toString();
  get countUp => _ref.watch(countDataProvider).countUp.toString();
  get countDown => _ref.watch(countDataProvider).countDown.toString();

  void onIncrease() {
    _logic.increase();
    update();
  }

  void onDecrease() {
    _logic.decrease();
    update();
  }

  void onReset() {
    _logic.reset();
    update();
  }

  void update() {
    CountData oldData = _ref.read(countDataProvider);
    _ref.read(countDataProvider.notifier).state = _logic.countData;
    CountData newData = _ref.read(countDataProvider);

    _soundLogic.dataChanged(oldData, newData);
  }
}
