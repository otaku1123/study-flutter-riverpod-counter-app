import 'package:flutter/animation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/data/count_data.dart';
import 'package:riverpod_app/logic/button_animation_logic.dart';
import 'package:riverpod_app/logic/logic.dart';
import 'package:riverpod_app/provider.dart';
import 'package:riverpod_app/logic/sound_logic.dart';

class ViewModel {
  final Logic _logic = Logic();

  final SoundLogic _soundLogic = SoundLogic();
  late ButtonAnimationLogic _buttonAnimationLogicPlus;

  late WidgetRef _ref;

  void init(WidgetRef ref, TickerProvider tickerProvider) {
    _ref = ref;

    _buttonAnimationLogicPlus = ButtonAnimationLogic(tickerProvider);
    _soundLogic.init();
  }

  void dispose() {
    _soundLogic.dispose();
  }

  get count => _ref.watch(countDataProvider).count.toString();
  get countUp => _ref.watch(countDataProvider).countUp.toString();
  get countDown => _ref.watch(countDataProvider).countDown.toString();

  get animationPlus => _buttonAnimationLogicPlus.animationScale;

  void onIncrease() {
    _logic.increase();
    _buttonAnimationLogicPlus.start();
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
