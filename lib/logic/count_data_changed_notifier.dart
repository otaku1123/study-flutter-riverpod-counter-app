import '../data/count_data.dart';

typedef ValueChangedCondition = bool Function(CountData oldData, CountData newData);

abstract class CountDataChangedNotifier {
  void dataChanged(CountData oldData, CountData newData);
}