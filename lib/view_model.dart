import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/logic.dart';
import 'package:riverpod_app/provider.dart';
import 'package:riverpod_app/sound_logic.dart';

class ViewModel {
  Logic _logic = Logic();

  SoundLogic _soundLogic = SoundLogic();

  late WidgetRef _ref;

  void setRef(WidgetRef ref) {
    _ref = ref;
  }

  get count => _ref.watch(countDataProvider).count.toString();
  get countUp => _ref.watch(countDataProvider).countUp.toString();
  get countDown => _ref.watch(countDataProvider).countDown.toString();

  void onIncrease() {
    _logic.increase();

    _ref.read(countDataProvider.notifier).state = _logic.countData;
    _soundLogic.playUpSound();
  }

  void onDecrease() {
    _logic.decrease();

    _ref.read(countDataProvider.notifier).state = _logic.countData;
    _soundLogic.playDownSound();
  }

  void onReset() {
    _logic.reset();

    _ref.read(countDataProvider.notifier).state = _logic.countData;
    _soundLogic.playResetSound();
  }
}
