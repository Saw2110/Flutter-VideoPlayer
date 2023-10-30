import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../video/video.dart';

class VideoCardWidget extends StatelessWidget {
  const VideoCardWidget({super.key, required this.videoInfo, this.onTap});

  final VideoDataModel videoInfo;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Color filterColor = videoInfo.source == "YouTube"
        ? youtubeColor
        : videoInfo.source == "Facebook"
            ? facebookColor
            : twitterColor;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.all(5.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                videoInfo.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              10.pHeight,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: filterColor),
                        borderRadius: BorderRadius.circular(20.0),
                        color: filterColor,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
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
                          Expanded(
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
                  Expanded(
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
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    videoInfo.thumbnail,
                    fit: BoxFit.cover,
                    height: 120.0,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        Assets().error,
                        fit: BoxFit.cover,
                        height: 120.0,
                      );
                    },
                  ),
                  Image.asset(
                    Assets().play,
                    fit: BoxFit.fitWidth,
                    height: 70.0,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
