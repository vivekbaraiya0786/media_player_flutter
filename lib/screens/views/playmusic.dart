import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../contoller/provider/musicprovider.dart';
import '../../utils/musiclist.dart';

class MusicPlay extends StatefulWidget {
  const MusicPlay({Key? key}) : super(key: key);

  @override
  State<MusicPlay> createState() => _MusicPlayState();
}

class _MusicPlayState extends State<MusicPlay> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _height = size.height;
    double _width = size.width;

    int music = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      body: PlayerBuilder.currentPosition(
        player: Provider.of<MusicPlayerProvider>(context).m1.assetsAudioPlayer!,
        builder: (context, position) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: _width * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "${songname[music]}\n",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                        TextSpan(
                            text: Moviename[music],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            )),
                      ]),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.share))
                  ],
                ),
                SizedBox(
                  height: _height * 0.1,
                ),
                Container(
                  width: _width * 0.75,
                  height: _height * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                          songimages[music],
                        ),
                        fit: BoxFit.fill,
                      )),
                ),
                SizedBox(
                  height: _height * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.tune,
                          color: Colors.black,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shuffle,
                          color: Colors.black,
                        )),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.network_check)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.heart,
                          color: Colors.black,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert_rounded,
                          color: Colors.black,
                        )),
                  ],
                ),
                SizedBox(
                  height: _height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "${position.inHours}:${position.inMinutes}:${position.inSeconds}",
                    ),
                    Text(
                      "${Provider.of<MusicPlayerProvider>(context).m1.totalduration.inHours}:${Provider.of<MusicPlayerProvider>(context).m1.totalduration.inMinutes}:${Provider.of<MusicPlayerProvider>(context).m1.totalduration.inSeconds}",
                    ),
                  ],
                ),
                Theme(
                  data: ThemeData(
                    sliderTheme: SliderThemeData(
                      disabledInactiveTrackColor: Colors.indigoAccent,
                      thumbColor: Colors.indigoAccent,
                      activeTrackColor: Colors.indigoAccent,
                    ),
                  ),
                  child: Slider(
                    max: Provider.of<MusicPlayerProvider>(context)
                        .m1
                        .totalduration
                        .inSeconds
                        .toDouble(),
                    value: position.inSeconds.toDouble(),
                    onChanged: (value) {
                      Provider.of<MusicPlayerProvider>(context, listen: false)
                          .m1
                          .assetsAudioPlayer!
                          .seek(
                        Duration(
                          seconds: value.toInt(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: _width * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.shuffle)),
                    IconButton(
                        onPressed: () {
                          Provider.of<MusicPlayerProvider>(context,
                              listen: false)
                              .previousSong();
                        },
                        icon: Icon(Icons.skip_previous_rounded)),
                    Container(
                      height: _height * 0.08,
                      width: _width * 0.2,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 3,
                          )),
                      child: IconButton(
                        onPressed: () {
                          Provider.of<MusicPlayerProvider>(context,
                              listen: false)
                              .startButton();
                          Provider.of<MusicPlayerProvider>(context,
                              listen: false)
                              .playpausebuttonchange();
                          // (Provider.of<MusicPlayerProvider>(context)
                          //     .m1
                          //     .buttonchange);
                        },
                        icon: (Provider.of<MusicPlayerProvider>(context)
                            .m1
                            .buttonchange)
                            ? Icon(Icons.pause, size: 30)
                            : Icon(Icons.play_arrow, size: 30),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Provider.of<MusicPlayerProvider>(context,
                              listen: false)
                              .nextSong();
                        },
                        icon: Icon(Icons.skip_next_rounded)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.shuffle_on)),
                  ],
                ),
                SizedBox(
                  height: _width * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.queue_music_outlined),
                        label: Text('LYRICS')),
                    TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.playlist_play_outlined),
                        label: Text('PLAYING QUEUE')),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }


}
