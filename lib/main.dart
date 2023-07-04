import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/logic/button_animation_logic.dart';
import 'package:riverpod_app/provider.dart';
import 'package:riverpod_app/view_model.dart';

import 'data/count_data.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        ViewModel(),
      ),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  ViewModel viewModel;
  MyHomePage(
    this.viewModel, {
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage>
    with TickerProviderStateMixin {
  late ViewModel _viewModel;

  @override
  void initState() {
    super.initState();

    _viewModel = widget.viewModel;
    _viewModel.init(ref, this);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ref.watch(titleProvider),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              ref.watch(descriptionProvider),
            ),
            Text(
              _viewModel.count,
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    _viewModel.onIncrease();
                  },
                  tooltip: 'Increment',
                  child: ButtonAnimation(
                    animationCombination: _viewModel.animationPlusCombination,
                    child: const Icon(CupertinoIcons.plus),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    _viewModel.onDecrease();
                  },
                  tooltip: 'Decrement',
                  child: ButtonAnimation(
                    animationCombination: _viewModel.animationMinusCombination,
                    child: const Icon(CupertinoIcons.minus),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  _viewModel.countUp,
                ),
                Text(
                  _viewModel.countDown,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _viewModel.onReset();
        },
        tooltip: 'Reset',
        child: ButtonAnimation(
          animationCombination: _viewModel.animationResetCombination,
          child: const Icon(CupertinoIcons.refresh),
        ),
      ),
    );
  }
}

class ButtonAnimation extends StatelessWidget {
  final AnimationCombination animationCombination;
  final Widget child;

  const ButtonAnimation({
    Key? key,
    required this.animationCombination,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animationCombination.animationScale,
      child: RotationTransition(
        turns: animationCombination.animationRotation,
        child: child,
      ),
    );
  }
}
