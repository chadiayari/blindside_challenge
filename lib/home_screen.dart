import 'package:blindside_challenge/components/video_widget.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';
//import '../../view_model/user_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
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
        child: ListView(
          children: const [
            VideoWidget(
                videoName: "Video Title 1",
                uploader: "Chadi Ayari",
                nbViews: "4M",
                months: 12,
                imageName: "2.jpg"),
            VideoWidget(
                videoName: "Video Title 1",
                uploader: "Chadi Ayari",
                nbViews: "4M",
                months: 12,
                imageName: "2.jpg"),
            VideoWidget(
                videoName: "Video Title 1",
                uploader: "Chadi Ayari",
                nbViews: "4M",
                months: 12,
                imageName: "2.jpg"),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    //_controller.close();
    super.dispose();
  }

  _openPopup(context) {
    // Alert(
    //     context: context,
    //     style: const AlertStyle(
    //       isCloseButton: false,
    //     ),
    //     title: "Add Comment",
    //     content: Column(
    //       children: <Widget>[
    //         TextField(
    //           decoration: InputDecoration(
    //             icon: Icon(Icons.comment),
    //             labelText: 'Comment',
    //           ),
    //           onChanged: (value) {
    //             // Provider.of<UserProvider>(context, listen: false)
    //             //     .addNewCommentToList(value);
    //           },
    //         ),
    //       ],
    //     ),
    //     buttons: [
    //       DialogButton(
    //         onPressed: () {
    //           Provider.of<UserProvider>(context, listen: false)
    //               .addNewComment()
    //               .then((value) => Navigator.pop(context));
    //         },
    //         child: Text(
    //           "Comment",
    //           style: TextStyle(color: Colors.white, fontSize: 20),
    //         ),
    //       ),
    //     ]).show();
  }
}
