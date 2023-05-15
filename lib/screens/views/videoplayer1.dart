
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../contoller/provider/videoprovider.dart';

class videoList_screen extends StatefulWidget {
  const videoList_screen({Key? key}) : super(key: key);

  @override
  State<videoList_screen> createState() => _videoList_screenState();
}

class _videoList_screenState extends State<videoList_screen> {

  video_provider? videoProviderTrue;
  video_provider? videoProviderFalse;


  @override
  Widget build(BuildContext context) {

    videoProviderTrue = Provider.of<video_provider>(context,listen: true);
    videoProviderFalse = Provider.of<video_provider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Video player"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {

                videoProviderTrue!.changeIndex(index);
                videoProviderFalse!.initVideo();
                Navigator.pushNamed(context, 'video-play',arguments: index);
              },
              child: Container(
                height: 200,width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.black,width: 3)
                ),
                margin: EdgeInsets.all(20),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset("${videoProviderFalse!.images[index]}",fit: BoxFit.cover,)),
              ),
            );
          },
          itemCount: videoProviderFalse!.images.length,
        ),
      ),
    );
  }
}