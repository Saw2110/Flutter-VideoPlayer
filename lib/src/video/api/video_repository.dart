import 'package:videoapplication/src/video/video.dart';

import '../../../core/core.dart';

class VideoRepository {
  final _helper = VideoHelper();

  Future<VideoModel> fetchVideoList() {
    return _helper.fetchVideoList();
  }
}
