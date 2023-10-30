import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:videoapplication/src/video/video.dart';

import '../../../src/video/components/video_details_screen.dart';
import 'routes_name.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case videoPath:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const VideoScreen(),
        );
      case videoDetailPath:
        VideoDataModel value = settings.arguments as VideoDataModel;
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: VideoDetailScreen(videoInfo: value),
        );

      default:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: Scaffold(
            appBar: AppBar(title: const Text("ERROR")),
            body: const Center(child: Text("ERROR")),
          ),
        );
    }
  }
}
