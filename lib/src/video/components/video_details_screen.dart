import 'package:flutter/material.dart';
import 'package:videoapplication/core/core.dart';
import 'package:videoapplication/src/video/model/video_model.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoDetailScreen extends StatefulWidget {
  final VideoDataModel videoInfo;
  const VideoDetailScreen({super.key, required this.videoInfo});

  @override
  State<VideoDetailScreen> createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    debugPrint("LINK  => ${widget.videoInfo.videoUrl}");
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    );

    _controller.loadVideoById(
      startSeconds: 136,
      videoId: widget.videoInfo.videoUrl.getYoutubeId(),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(title: const Text('Post'), actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          ]),
          body: ListView(
            children: [
              player,
              // const VideoPositionIndicator(),
              // const Controls(),
              detail(),
            ],
          ),
        );
      },
    );
  }

  Widget detail() {
    VideoDataModel videoInfo = widget.videoInfo;
    Color filterColor = videoInfo.source == "YouTube"
        ? youtubeColor
        : videoInfo.source == "Facebook"
            ? facebookColor
            : twitterColor;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: filterColor),
                    borderRadius: BorderRadius.circular(20.0),
                    color: filterColor,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.network(
                            videoInfo.sourceImg,
                            height: 15.0,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                Assets().error,
                                fit: BoxFit.fitWidth,
                              );
                            },
                          ),
                        ),
                      ),
                      5.pWidth,
                      Flexible(
                        flex: 2,
                        child: Text(
                          videoInfo.source,
                          style: const TextStyle(
                            fontSize: 11.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  videoInfo.createdDate.toAgo(),
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontSize: 11.0,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
          10.pHeight,
          Text(
            videoInfo.title,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),
          ),
          10.pHeight,
          Text(
            "${videoInfo.views} views   ${videoInfo.createdDate.toEnglishDate().toEnglishFormatedMonth()}   ${videoInfo.tags}",
            style: const TextStyle(fontSize: 15.0, height: 1.5),
          ),
          20.pHeight,
          Text(
            videoInfo.description.replaceAll("!!! ", "!!!\n\n"),
            style: const TextStyle(fontSize: 15.0, height: 1.5),
          ),
          10.pHeight,
          Text(
            videoInfo.urlDetail,
            style: const TextStyle(fontSize: 15.0, height: 1.5),
          ),
        ],
      ),
    );
  }
}
