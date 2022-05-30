import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  final String videoName;
  final String uploader;
  final String nbViews;
  final int months;
  final String imageName;

  const VideoWidget({
    Key? key,
    required this.videoName,
    required this.uploader,
    required this.nbViews,
    required this.months,
    required this.imageName,
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
                  image: AssetImage("assets/images/" + imageName)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              margin: EdgeInsets.all(size.width * 0.15),
              child: RawMaterialButton(
                onPressed: () {},
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
