import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blindside_challenge/components/video_player_widget.dart';
import 'package:video_player/video_player.dart';

import 'components/video_widget.dart';
import 'models/video_model.dart';

class AssetPlayerScreen extends StatefulWidget {
  final String videoName;
  final String videoNumber;
  final String uploader;
  final String nbViews;
  final List<Video> videos;
  final int months;
  final String coverName;
  const AssetPlayerScreen({
    Key? key,
    required this.videoName,
    required this.videoNumber,
    required this.uploader,
    required this.nbViews,
    required this.months,
    required this.videos,
    required this.coverName,
  }) : super(key: key);

  @override
  _AssetPlayerScreen createState() => _AssetPlayerScreen();
}

class _AssetPlayerScreen extends State<AssetPlayerScreen> {
  VideoPlayerController? controller;
  String videoName = "";
  String videoNumber = "";
  String uploader = "";
  String nbViews = "";
  int months = 0;
  String coverName = "";
  String asset = 'assets/videos/';
  bool comments = true;
  List<Video> videos = [];

  @override
  void initState() {
    super.initState();
    videoName = widget.videoName;
    uploader = widget.uploader;
    nbViews = widget.nbViews;
    months = widget.months;
    videos = widget.videos;
    coverName = widget.coverName;
    videoNumber = widget.videoNumber;
    controller = VideoPlayerController.asset(asset + videoNumber + ".mp4")
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller?.play());
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = controller?.value.volume == 0;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          VideoPlayerWidget(controller: controller!),
          const SizedBox(height: 32),
          if (controller!.value.isInitialized)
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue,
              child: IconButton(
                icon: Icon(
                  isMuted ? Icons.volume_mute : Icons.volume_up,
                  color: Colors.white,
                ),
                onPressed: () => controller!.setVolume(isMuted ? 1 : 0),
              ),
            ),
          SizedBox(height: size.height * 0.03),
          Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  videoName,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: size.height * 0.02),
                Row(
                  children: [
                    Text(
                      uploader + " - ",
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                    Text(
                      nbViews + "views - ",
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                    Text(
                      months.toString() + " months ago",
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Comments",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    CupertinoSwitch(
                      value: comments,
                      onChanged: (value) {
                        comments = value;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                comments
                    ? Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        style: TextStyle(color: Colors.white),
                      )
                    : Container(),
                SizedBox(height: size.height * 0.04),
                Text(
                  "Related videos",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.02),
                for (int i = 0; i < 3; i++)
                  VideoWidget(
                    videoName: videos[i].videoName,
                    uploader: videos[i].uploader,
                    nbViews: videos[i].nbViews,
                    months: videos[i].months,
                    videos: videos,
                    coverName: videos[i].coverName,
                    videoNumber: videos[i].videoNumber,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
