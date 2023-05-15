import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class video_provider extends ChangeNotifier {

  List VideoList = [
    "assets/video/video/KAUN_TUJHE_Full__Video___M.S._DHONI_-THE_UNTOLD_STORY__Amaal_Mallik_Palak_Sushan.mp4",
    "assets/video/video/Khairiyat_Video___Chhichhore___Nitesh_Tiwari___Arijit_Singh___Sushant,_Shraddha___Pritam___Amitabh_B(480p).mp4",
    "assets/video/video/Pal_-_Full_Song___Arijit_Singh___Shreya_Ghoshal___Rhea_&_Varun_Javed_-_Mohsin.mp4",
    "assets/video/video/Pal_Pal_Dil_Ke_Paas_–Title___Sunny_Deol,Karan_Deol,Sahher___Arijit_Singh,Parampara,Sachet,Rishi_Rich(480p).mp4",
    "assets/video/video/Yaari_(Official_Video)___Nikk_Ft_Avneet_Kaur___Latest_Punjabi_Songs_2019___New_Punjabi_Songs_2019(480p).mp4",
  ];

  List images = [
    "assets/musicplayer/images/download (1).jpeg",
    "assets/musicplayer/images/download (1).jpeg",
    "assets/musicplayer/images/download (1).jpeg",
    "assets/musicplayer/images/download (1).jpeg",
    "assets/musicplayer/images/download (1).jpeg",

  ];

  ChewieController? chewieController;
  VideoPlayerController? videoPlayerController;
  int selectedVideoIndex = 0;

  void initVideo() {

    videoPlayerController = VideoPlayerController.asset("${VideoList[selectedVideoIndex]}");
    videoPlayerController?.initialize();

    chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        autoPlay: false,
        looping: false);
  }

  void changeIndex(int index)
  {
    selectedVideoIndex = index;
    notifyListeners();
  }
}