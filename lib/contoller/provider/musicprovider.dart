

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';

import '../../modals/musicmodel.dart';
import '../../utils/musiclist.dart';

class MusicPlayerProvider extends ChangeNotifier {
  MusicPlayerModel m1 = MusicPlayerModel(
    totalduration: Duration(seconds: 0),
    buttonchange: false,
    mutebutton: true,
    index: 0,
  );


  void playpausebuttonchange(){
    m1.buttonchange = !m1.buttonchange;
  }

  initAudio() {
    m1.assetsAudioPlayer = AssetsAudioPlayer();
    m1.assetsAudioPlayer!.open(
      Playlist(
        audios: myallaudiosongs,
        startIndex: m1.index,
      ),
      showNotification: true,
      // playInBackground: PlayInBackground.disabledPause,
      autoStart: false,
    );
    totalDurationAudio();
  }
  Future<void> startButton() async {
    await m1.assetsAudioPlayer!.playOrPause();
    notifyListeners();
  }

  Future<void> stopAudio() async {
    await m1.assetsAudioPlayer!.stop();
    notifyListeners();
  }

  Future<void> nextSong() async {
    await m1.assetsAudioPlayer!.next();
    notifyListeners();
  }

  Future<void> previousSong() async {
    await m1.assetsAudioPlayer!.previous();
    notifyListeners();
  }
  void muteUnmute() {
    m1.assetsAudioPlayer!.setVolume(m1.mutebutton ? 0 : 1);
    m1.mutebutton = !m1.mutebutton;
    notifyListeners();
  }


  void totalDurationAudio() {
    m1.assetsAudioPlayer!.current.listen((event) {
      m1.totalduration = event!.audio.duration;
      notifyListeners();
    });
  }

  getIndex(int i) {
    m1.index = i;
    notifyListeners();
  }

// addIndex() {
//   int length = SingerImage.length;
//   if (m1.index <= length) {
//     m1.index++;
//   } else {
//     m1.index = 0;
//   }
//   notifyListeners();
// }
//
// subIndex() {
//   if (m1.index >= 0) {
//     m1.index--;
//   } else {
//     m1.index = 9;
//   }
//   notifyListeners();
// }

}


