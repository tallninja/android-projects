import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:kaizen_app/screens/core/const.dart';
import 'package:video_player/video_player.dart';

class Page6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(AppColors.lightBlueShadow);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: Text('Learning Materials ',
            style: TextStyle(
              color: Colors.white, //stylecolor
            )),
        //  backgroundColor: Color(0XFFe5eefc), //maincolor
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.mainColor,
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                ChewieListItem(
                  videoPlayerController: VideoPlayerController.asset(
                    'assets/Video/Captain_Jack.mp4',
                  ),
                  looping: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChewieListItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  ChewieListItem({
    @required this.videoPlayerController,
    this.looping,
    Key key,
  }) : super(key: key);

  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      looping: widget.looping,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.red),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
