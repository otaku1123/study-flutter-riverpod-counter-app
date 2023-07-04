import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/provider.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
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
              ref.watch(countDataProvider).count.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    CountData data = ref.read(countDataProvider);

                    ref.read(countDataProvider.notifier).state = data.copyWith(
                      count: data.count + 1,
                      countUp: data.countUp + 1,
                    );
                  },
                  tooltip: 'Increment',
                  child: const Icon(CupertinoIcons.plus),
                ),
                FloatingActionButton(
                  onPressed: () {
                    CountData data = ref.read(countDataProvider);

                    ref.read(countDataProvider.notifier).state = data.copyWith(
                      count: data.count - 1,
                      countDown: data.countDown + 1,
                    );
                  },
                  tooltip: 'Decrement',
                  child: const Icon(CupertinoIcons.minus),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  ref.watch(countDataProvider).countUp.toString(),
                ),
                Text(
                  ref.watch(countDataProvider).countDown.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(countDataProvider.notifier).state =
              CountData(count: 0, countUp: 0, countDown: 0);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
