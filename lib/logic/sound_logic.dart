import 'package:audioplayers/audioplayers.dart';

import '../data/count_data.dart';

class SoundLogic {
  static const SOUND_DATA_UP = 'sounds/sound1.mp3';
  static const SOUND_DATA_DOWN = 'sounds/sound2.mp3';
  static const SOUND_DATA_RESET = 'sounds/sound3.mp3';

  final audioPlayer = AudioPlayer();

  void init() {
    audioPlayer.setReleaseMode(ReleaseMode.release);
  }

  void dispose() {
    audioPlayer.dispose();
  }

  void dataChanged(CountData oldData, CountData newData) {
    if (newData.countUp == 0 && newData.countDown == 0) {
      playResetSound();
    } else if (oldData.count < newData.count) {
      playUpSound();
    } else if (oldData.count > newData.count) {
      playDownSound();
    } else {
      // invalid path
    }
  }

  void playUpSound() async {
    try {
      await audioPlayer.play(AssetSource(SOUND_DATA_UP));
    } catch (e) {
      print(e);
    }
  }

  void playDownSound() async {
    try {
      await audioPlayer.play(AssetSource(SOUND_DATA_DOWN));
    } catch (e) {
      print(e);
    }
  }

  void playResetSound() async {
    try {
      await audioPlayer.play(AssetSource(SOUND_DATA_RESET));
    } catch (e) {
      print(e);
    }
  }
}
