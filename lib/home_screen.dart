import 'package:blindside_challenge/components/video_widget.dart';
import 'package:blindside_challenge/models/video_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';
//import '../../view_model/user_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Video> videos = [
    Video(
        videoName: "Video A",
        uploader: "Chadi Ayari",
        nbViews: "1M",
        months: 1,
        videoNumber: "1",
        coverName: "1"),
    Video(
        videoName: "Glady's Murphy",
        uploader: "Great",
        nbViews: "3M",
        months: 2,
        videoNumber: "2",
        coverName: "2"),
    Video(
        videoName: "Jorge Henry",
        uploader: "Hey",
        nbViews: "1.2M",
        months: 3,
        videoNumber: "3",
        coverName: "3"),
    Video(
        videoName: "Busy!",
        uploader: "Fox",
        nbViews: "3.2K",
        months: 3,
        videoNumber: "4",
        coverName: "4"),
    Video(
        videoName: "Song name",
        uploader: "Debra Hawkins",
        nbViews: "2.1M",
        months: 11,
        videoNumber: "5",
        coverName: "5"),
    Video(
        videoName: "Test video",
        uploader: "Jacob Ayari",
        nbViews: "122K",
        months: 2,
        videoNumber: "6",
        coverName: "6"),
    Video(
        videoName: "Flutter tuto",
        uploader: "Google",
        nbViews: "30M",
        months: 10,
        videoNumber: "7",
        coverName: "1"),
    Video(
        videoName: "John Wick tutorial",
        uploader: "John Wick",
        nbViews: "1M",
        months: 1,
        videoNumber: "8",
        coverName: "2"),
  ];
  @override
  void initState() {
    super.initState();
    Loader.hide();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Text('Blindside Movies'),
          ],
        ),
        actions: [
          RawMaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04, vertical: size.height * 0.04),
        color: Colors.black,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ListView.builder(
            itemCount: videos.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 16),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return VideoWidget(
                videoName: videos[index].videoName,
                uploader: videos[index].uploader,
                nbViews: videos[index].nbViews,
                months: videos[index].months,
                coverName: videos[index].coverName,
                videos: videos,
                videoNumber: videos[index].videoNumber,
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    //_controller.close();
    super.dispose();
  }
}
