
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../contoller/provider/videoprovider.dart';

class video_screen extends StatefulWidget {
  const video_screen({Key? key}) : super(key: key);

  @override
  State<video_screen> createState() => _video_screenState();
}

class _video_screenState extends State<video_screen> {

  @override

  Widget build(BuildContext context) {

    // int i = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Video Play Screen"),
        ),
        body: Column(
          children: [
            Container(
              height: 200,width: double.infinity,
              margin: EdgeInsets.all(20),
              child: Chewie(controller: Provider.of<video_provider>(context,listen: true).chewieController!),
            ),
          ],
        ),
      ),
    );
  }

}