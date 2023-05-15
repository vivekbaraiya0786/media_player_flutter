
import 'package:assets_audio_player/assets_audio_player.dart';

class MusicPlayerModel {
  AssetsAudioPlayer? assetsAudioPlayer;
  Duration totalduration;
  bool buttonchange;
  bool mutebutton;
  int index;

  MusicPlayerModel({
    this.assetsAudioPlayer,
    required this.totalduration,
    required this.buttonchange,
    required this.mutebutton,
    required this.index,
  });
}
