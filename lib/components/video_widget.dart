import 'package:flutter/material.dart';

import '../asset_player_screen.dart';
import '../models/video_model.dart';

class VideoWidget extends StatelessWidget {
  final String videoName;
  final String videoNumber;
  final String uploader;
  final String nbViews;
  final List<Video> videos;
  final int months;
  final String coverName;

  const VideoWidget({
    Key? key,
    required this.videoName,
    required this.videoNumber,
    required this.uploader,
    required this.nbViews,
    required this.videos,
    required this.months,
    required this.coverName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: size.width,
            height: size.height * 0.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstATop),
                  image: AssetImage("assets/images/" + coverName + ".jpg")),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              margin: EdgeInsets.all(size.width * 0.15),
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AssetPlayerScreen(
                          videoName: videoName,
                          uploader: uploader,
                          nbViews: nbViews,
                          months: months,
                          videoNumber: videoNumber,
                          videos: videos,
                          coverName: coverName),
                    ),
                  );
                },
                fillColor: Colors.blue,
                child: Icon(
                  Icons.play_arrow,
                  size: size.width * 0.08,
                  color: Colors.white,
                ),
                shape: const CircleBorder(),
              ),
            )),
        SizedBox(height: size.height * 0.01),
        Text(
          videoName,
          style: const TextStyle(color: Colors.white),
        ),
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
      ],
    );
  }
}
