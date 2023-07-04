import '../data/count_data.dart';

abstract class CountDataChangedNotifier {
  void dataChanged(CountData oldData, CountData newData);
}