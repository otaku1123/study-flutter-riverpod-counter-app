import 'package:audioplayers/audioplayers.dart';

import 'data/count_data.dart';

class SoundLogic {
  static const SOUND_DATA_UP = 'sounds/sound1.mp3';
  static const SOUND_DATA_DOWN = 'sounds/sound2.mp3';
  static const SOUND_DATA_RESET = 'sounds/sound3.mp3';

  final audioPlayer = AudioPlayer();

  void dataChanged(CountData oldData, CountData newData) {
    if (oldData.count < newData.count) {
      playUpSound();
    } else if (oldData.count > newData.count) {
      playDownSound();
    } else if(newData.countUp == 0 && newData.countDown == 0) {
      playResetSound();
    } else {
      // invalid path
    }
  }

  void playUpSound() {
    audioPlayer.play(AssetSource(SOUND_DATA_UP));
  }

  void playDownSound() {
    audioPlayer.play(AssetSource(SOUND_DATA_DOWN));
  }

  void playResetSound() {
    audioPlayer.play(AssetSource(SOUND_DATA_RESET));
  }
}