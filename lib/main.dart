import 'package:flutter/material.dart';
import 'package:media_payer_app1/screens/views/musichomescreen.dart';
import 'package:media_payer_app1/screens/views/playmusic.dart';
import 'package:media_payer_app1/screens/views/videoplayer1.dart';
import 'package:media_payer_app1/screens/views/videoplayer2.dart';
import 'package:media_payer_app1/utils/apptheme.dart';
import 'package:provider/provider.dart';
import 'contoller/provider/musicprovider.dart';
import 'contoller/provider/videoprovider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MusicPlayerProvider(),),
        ChangeNotifierProvider(create: (context) => video_provider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode:ThemeMode.system,
        // initialRoute: 'music-play',
        routes: {
          '/':(context) => Homepage(),
          'music-play':(context) => MusicPlay(),
          'videolist':(context) => videoList_screen(),
          'video-play':(context) => video_screen(),


          // '/':(context) => homepage(),
          // 'Music' : (context) => Musicscreen(),
          // 'Music2' : (context) =>music2(),
        },
      ),
    ),
  );
}