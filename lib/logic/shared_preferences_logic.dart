import 'package:shared_preferences/shared_preferences.dart';

import '../data/count_data.dart';
import 'count_data_changed_notifier.dart';

class SharedPreferencesLogic extends CountDataChangedNotifier {
  static const keyCount = 'COUNT';
  static const keyCountUp = 'COUNT_UP';
  static const keyCountDown = 'COUNT_DOWN';

  @override
  void dataChanged(CountData oldData, CountData newData) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(keyCount, newData.count);
    sharedPreferences.setInt(keyCountUp, newData.countUp);
    sharedPreferences.setInt(keyCountDown, newData.countDown);
  }

  static Future<CountData> read() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int count = sharedPreferences.getInt(keyCount) ?? 0;
    int countUp = sharedPreferences.getInt(keyCountUp) ?? 0;
    int countDown = sharedPreferences.getInt(keyCountDown) ?? 0;
    return CountData(
      count: count,
      countUp: countUp,
      countDown: countDown,
    );
  }
}
