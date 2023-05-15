import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../contoller/provider/musicprovider.dart';
import '../utils/musiclist.dart';


class tracks extends StatefulWidget {
  const tracks({Key? key}) : super(key: key);

  @override
  State<tracks> createState() => _tracksState();
}

class _tracksState extends State<tracks> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _height = size.height;
    double _width = size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView.builder(itemCount: songimages.length,itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset(songimages[index]),
              title: Text(songname[index]),
              subtitle: Text(Moviename[index]),
              trailing: IconButton(
                onPressed: () {

                },
                icon: Icon(Icons.more_vert_rounded),
              ),
              onTap: () {
                Provider.of<MusicPlayerProvider>(context, listen: false)
                    .getIndex(index);
                Provider.of<MusicPlayerProvider>(context, listen: false)
                    .initAudio();
                Navigator.of(context)
                    .pushNamed("music-play", arguments: index);
              },
            );
          },),
        ),
      ),
    );
  }
}
