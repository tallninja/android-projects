//import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:kaizen_app/screens/core/const.dart';
import 'package:video_player/video_player.dart';

// void onPlayAudio() async {
//   AssetsAudioPlayer.newPlayer().open(
//     Audio("assets/Date La Vuelta.mp3"),
//     showNotification: true,
//   );
// }

class Page7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(AppColors.lightBlueShadow);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: Text('Acess Learing Materials',
            style: TextStyle(
              color: Colors.white, //stylecolor
            )),
        // backgroundColor: Color(0XFFe5eefc), //maincolor
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              ChewieListItem(
                videoPlayerController: VideoPlayerController.network(
                  // 'https://vimeo.com/533039238'
                  //'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4'
                  'https://music9999.s3.ap-south-1.amazonaws.com/Video.mp4',
                ),
                looping: true,
              ),
            ],
          ),
        ],
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
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
