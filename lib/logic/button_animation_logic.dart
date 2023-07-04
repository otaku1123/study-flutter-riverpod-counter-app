import 'package:flutter/animation.dart';

import '../data/count_data.dart';
import 'count_data_changed_notifier.dart';

class ButtonAnimationLogic extends CountDataChangedNotifier {
  late AnimationController _animationController;
  late Animation<double> _animationScale;
  get animationScale => _animationScale;

  ValueChangedCondition startCondition;

  ButtonAnimationLogic(TickerProvider tickerProvider, this.startCondition) {
    _animationController = AnimationController(
      vsync: tickerProvider,
      duration: const Duration(milliseconds: 500),
    );

    _animationScale = _animationController
        .drive(CurveTween(curve: const Interval(0.1, 0.7)))
        .drive(Tween(begin: 1.0, end: 1.8));
  }

  @override
  void dispose() {
    _animationController.dispose();
  }

  void start() {
    _animationController
        .forward()
        .whenComplete(() => _animationController.reset());
  }

  @override
  void dataChanged(CountData oldData, CountData newData) {
    if (startCondition(oldData, newData)) {
      start();
    }
  }
}
