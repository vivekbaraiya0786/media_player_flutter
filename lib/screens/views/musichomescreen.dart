import 'package:flutter/material.dart';

import '../../componets/tracks.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> alltabs = [
    {
      'title': 'Tracks',
      'page': tracks(),
    },
    {
      'title': 'PlayList',
      'page': Center(
        child: Text("Second"),
      ),
    },
    {
      'title': 'Album',
      'page': Center(
        child: Text("Third"),
      ),
    },
    {
      'title': 'Artists',
      'page': Center(
        child: Text("First"),
      ),
    },
    {
      'title': 'Folders',
      'page': Center(
        child: Text("Second"),
      ),
    },
  ];

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: alltabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _height = size.height;
    double _width = size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Music",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: TabBar(
          isScrollable: true,
          controller: tabController,
          tabs: alltabs
              .map((e) => Tab(
            text: e["title"],
          ))
              .toList(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('videolist');
            },
            icon: Icon(Icons.video_collection_rounded),
          )
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: alltabs.map<Widget>((e) => e['page']).toList(),
      ),
    );
  }
}
